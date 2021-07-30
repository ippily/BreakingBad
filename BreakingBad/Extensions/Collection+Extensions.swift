//
//  Collection+Extensions.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
