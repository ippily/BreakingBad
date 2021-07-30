//
//  Episode.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

struct Episode: Decodable, Equatable {

    private enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case season
        case episode
        case airDate = "air_date"
        case characters
        case series
    }

    let id: Int
    let title: String
    let season: String
    let episode: String
    let airDate: String
    let characters: [String]
    let series: String
}
