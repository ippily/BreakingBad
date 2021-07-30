//
//  EpisodeMock.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
@testable import BreakingBad

extension Episode {
    static func mock(id: Int = 123,
                     title: String = "Episode title",
                     season: String = "2",
                     episode: String = "4",
                     airDate: String = "air date",
                     characters: [String] = ["test"],
                     series: String = "test") -> Episode {
        .init(
            id: id,
            title: title,
            season: season,
            episode: episode,
            airDate: airDate,
            characters: characters,
            series: series
        )
    }

    static var mockEpisodes: [Episode] {
        [
            .mock(), .mock()
        ]
    }
}
