//
//  CharacterTableViewCell.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    struct ViewState: Equatable {
        let title: String
    }
}

extension CharacterTableViewCell {
    func setViewState(_ state: ViewState) {
        textLabel?.text = state.title
    }
}
