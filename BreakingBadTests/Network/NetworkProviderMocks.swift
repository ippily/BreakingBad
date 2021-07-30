//
//  NetworkProviderMocks.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
@testable import BreakingBad

enum MockError: Error {
    case generic
}

class NetworkProviderSuccessMock: NetworkProviderProtocol {
    func dataRequest(_ request: Request, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let data = Data([0, 1, 0, 1])
        completion(.success(data))
    }
}

class NetworkProviderFailureMock: NetworkProviderProtocol {
    func dataRequest(_ request: Request, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        completion(.failure(.underlying(MockError.generic)))
    }
}
