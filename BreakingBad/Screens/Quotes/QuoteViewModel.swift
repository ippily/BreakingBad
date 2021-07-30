//
//  QuoteViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 30/07/2021.
//

import Foundation

final class QuoteViewModel {

    private let quote: Quote

    var title: String {
        "By \(quote.author)"
    }

    init(quote: Quote) {
        self.quote = quote
    }
}
