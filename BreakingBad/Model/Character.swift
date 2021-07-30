//
//  Character.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

struct Character: Decodable, Equatable {

    private enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case birthday
        case occupation
        case img
        case status
        case nickname
        case appearance
        case portrayed
        case category
    }

    let id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
}
