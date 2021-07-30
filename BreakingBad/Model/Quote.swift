//
//  Quote.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

struct Quote: Decodable, Equatable {

    private enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case quote
        case author
        case series
    }
    
    let id: Int
    let quote: String
    let author: String
    let series: String
}
