//
//  EpisodeViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 30/07/2021.
//

import Foundation

final class EpisodeViewModel {

    private let episode: Episode

    var title: String {
        episode.title
    }

    init(episode: Episode) {
        self.episode = episode
    }
}
