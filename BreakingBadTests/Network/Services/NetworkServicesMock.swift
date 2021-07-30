//
//  NetworkServicesMock.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift
@testable import BreakingBad

class CharacterNetworkServiceMock: CharactersNetworkServiceProtocol {

    private let characters: [Character]?

    init(characters: [Character]?) {
        self.characters = characters
    }

    func perform() -> Observable<[Character]> {
        guard let characters = characters else {
            return .error(MockError.generic)
        }
        return .just(characters)
    }
}

class EpisodesNetworkServiceMock: EpisodesNetworkServiceProtocol {

    private let episodes: [Episode]?

    init(episodes: [Episode]?) {
        self.episodes = episodes
    }

    func perform() -> Observable<[Episode]> {
        guard let episodes = episodes else {
            return .error(MockError.generic)
        }
        return .just(episodes)
    }
}

class QuotesNetworkServiceMock: QuotesNetworkServiceProtocol {

    private let quotes: [Quote]?

    init(quotes: [Quote]?) {
        self.quotes = quotes
    }

    func perform() -> Observable<[Quote]> {
        guard let quotes = quotes else {
            return .error(MockError.generic)
        }
        return .just(quotes)
    }
}
