//
//  QuoteMock.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
@testable import BreakingBad

extension Quote {
    static func mock(id: Int = 123,
                     quote: String = "Lorem Ipsum",
                     author: String = "Jane Doe",
                     series: String = "Test Series") -> Quote {
        .init(
            id: id,
            quote: quote,
            author: author,
            series: series
        )
    }

    static var mockQuotes: [Quote] {
        [
            .mock(), .mock(), .mock(), .mock()
        ]
    }
}
