//
//  QuotesRequest.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import Foundation

struct QuotesRequest: Request {
    var baseEndpoint: APIBaseEndpoint {
        .base
    }

    var pathComponents: [String]? {
        ["api", "quotes"]
    }

    var method: HTTPMethod {
        .get
    }
}
