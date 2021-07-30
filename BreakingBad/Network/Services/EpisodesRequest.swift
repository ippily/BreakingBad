//
//  EpisodesRequest.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import Foundation

struct EpisodesRequest: Request {
    var baseEndpoint: APIBaseEndpoint {
        .base
    }

    var pathComponents: [String]? {
        ["api", "episodes"]
    }

    var method: HTTPMethod {
        .get
    }
}
