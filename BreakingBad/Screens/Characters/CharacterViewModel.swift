//
//  CharacterViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation

final class CharacterViewModel {

    private let character: Character

    var title: String {
        character.name
    }

    init(character: Character) {
        self.character = character
    }
}
