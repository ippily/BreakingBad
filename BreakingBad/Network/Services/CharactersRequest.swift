//
//  CharactersRequest.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

struct CharactersRequest: Request {
    var baseEndpoint: APIBaseEndpoint {
        .base
    }

    var pathComponents: [String]? {
        ["api", "characters"]
    }

    var method: HTTPMethod {
        .get
    }
}
