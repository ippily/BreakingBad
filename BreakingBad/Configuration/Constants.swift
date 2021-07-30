//
//  Constants.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

enum APIBaseEndpoint {
    case base

    var asString: String {
        switch self {
        case .base:
            return "https://www.breakingbadapi.com"
        }
    }
}
