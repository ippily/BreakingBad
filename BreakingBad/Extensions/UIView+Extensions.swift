//
//  UIView+Extensions.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import UIKit

extension UIView {

    /// Add and activate the array of constraints to the receiver
    final func layout(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)

        layoutIfNeeded()
    }
}
