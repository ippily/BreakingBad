//
//  NetworkProvider.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation

enum NetworkError: Error {
    case http(statusCode: Int, URLResponse)
    case url(URLError)
    case decoding(Error, URLResponse)
    case underlying(Error)
    case invalidEndpoint
    case invalidResponse
    case invalidStatusCode
}

protocol NetworkProviderProtocol {
    func dataRequest(_ request: Request, _ completion: @escaping (Result<Data, NetworkError>) -> Void)
}

struct NetworkProvider: NetworkProviderProtocol {
    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func dataRequest(_ request: Request, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let request = try? request.asURLRequest() else {
            completion(.failure(.invalidEndpoint))
            return
        }

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.underlying(error)))
            }

            guard let response = response, let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(.failure(.invalidStatusCode))
                return
            }

            switch (statusCode, data) {
            case (200...299, data):
                completion(.success(data))
            case (let statusCode, _):
                completion(.failure(.http(statusCode: statusCode, response)))
            }
        }.resume()
    }
}
