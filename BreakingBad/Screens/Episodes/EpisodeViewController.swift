//
//  EpisodeViewController.swift
//  BreakingBad
//
//  Created by Emily Ip on 30/07/2021.
//

import UIKit

final class EpisodeViewController: BaseTableViewController {

    private let viewModel: EpisodeViewModel

    init(viewModel: EpisodeViewModel) {
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
