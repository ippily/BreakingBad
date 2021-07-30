//
//  CharacterViewController.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import UIKit

final class CharacterViewController: BaseTableViewController {

    private let viewModel: CharacterViewModel

    init(viewModel: CharacterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
    }
}
