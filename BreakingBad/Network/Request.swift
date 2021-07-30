//
//  Requests.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol Request {
    var baseEndpoint: APIBaseEndpoint { get }
    var method: HTTPMethod { get }
    var pathComponents: [String]? { get }
}

enum RequestError: Error {
    case unableToCreateRequest
    case unableToCreateComponents
    case unableToCreateURLFromComponents
}

extension Request {
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseEndpoint.asString) else {
            throw RequestError.unableToCreateRequest
        }

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw RequestError.unableToCreateComponents
        }

        var components = [String]()
        if let pathComponents = pathComponents {
            components.append(contentsOf: pathComponents.compactMap { $0 })
            urlComponents.path = "/" + components
                .filter { !$0.isEmpty }
                .joined(separator: "/")
        }

        guard let urlWithQuery = urlComponents.url else {
            throw RequestError.unableToCreateURLFromComponents
        }

        var request = URLRequest(url: urlWithQuery)
        request.allHTTPHeaderFields = ["Accept":"application/json",
                                       "Content-Type":"application/json"]

        request.httpMethod = method.rawValue

        return request
    }
}
