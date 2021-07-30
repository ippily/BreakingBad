//
//  RequestMocks.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
@testable import BreakingBad

class RequestMock: Request {
    var baseEndpoint: APIBaseEndpoint {
        .base
    }

    var method: HTTPMethod {
        .get
    }

    var pathComponents: [String]? {
        ["test"]
    }
}
