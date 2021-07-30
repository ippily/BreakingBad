//
//  CharactersViewController.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import RxSwift
import UIKit

final class CharactersViewController: BaseTableViewController {

    private let viewModel = CharactersViewModel()
    private let dataSource = CharactersDataSource()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Characters"
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: String(describing: CharacterTableViewCell.self))
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

        dataSource.characterSelected = { [weak self] character in
            guard let self = self else { return }
            let vm = CharacterViewModel(character: character)
            let vc = CharacterViewController(viewModel: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
