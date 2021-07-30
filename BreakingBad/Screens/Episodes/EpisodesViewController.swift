//
//  EpisodesViewController.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import Foundation
import RxSwift

final class EpisodesViewController: BaseTableViewController {

    private let viewModel = EpisodesViewModel()
    private let dataSource = EpisodesDataSource()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Episodes"
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: String(describing: EpisodesTableViewCell.self))
        tableView.rowHeight = 100
        setupBindings()
        viewModel.input.ready.onNext(())
    }
    
    private func setupBindings() {
        tableView.rx
            .setDelegate(dataSource)
            .disposed(by: disposeBag)

        viewModel.output
            .state
            .map { $0.rows }
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.output
            .loading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel.output
            .loading
            .drive(tableView.rx.isHidden)
            .disposed(by: disposeBag)

        dataSource.episodeSelected = { [weak self] episode in
            guard let self = self else { return }
            let vm = EpisodeViewModel(episode: episode)
            let vc = EpisodeViewController(viewModel: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
