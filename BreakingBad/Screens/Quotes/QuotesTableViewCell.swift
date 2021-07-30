//
//  QuotesTableViewCell.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {
    struct ViewState: Equatable {
        let title: String
    }

    // MARK: Initialisation

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        textLabel?.numberOfLines = 0
    }
}

extension QuotesTableViewCell {
    func setViewState(_ state: ViewState) {
        textLabel?.text = state.title
    }
}
