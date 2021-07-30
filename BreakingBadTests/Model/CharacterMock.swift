//
//  CharacterMock.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
@testable import BreakingBad

extension Character {
    static func mock(id: Int = 123456,
                     name: String = "Walter White",
                     birthday: String = "09-07-1958",
                     occupation: [String] = ["High Schoool Chemistry Teacher"],
                     img: String = "",
                     status: String = "Deceased",
                     nickname: String = "Heisenberg",
                     appearance: [Int] = [1, 2, 3, 4, 5],
                     portrayed: String = "Bryan Cranston",
                     category: String = "Breaking Bad") -> Character {
        Character(
            id: id,
            name: name,
            birthday: birthday,
            occupation: occupation,
            img: img,
            status: status,
            nickname: nickname,
            appearance: appearance,
            portrayed: portrayed,
            category: category
        )
    }

    static var mockCharacters: [Character] {
        [
            .mock(), .mock(), .mock()
        ]
    }
}
