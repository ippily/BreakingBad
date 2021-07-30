//
//  QuotesViewController.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import Foundation
import RxSwift

final class QuotesViewController: BaseTableViewController {

    private let viewModel = QuotesViewModel()
    private let dataSource = QuotesDataSource()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Quotes"
        tableView.register(QuotesTableViewCell.self, forCellReuseIdentifier: String(describing: QuotesTableViewCell.self))
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

        dataSource.quoteSelected = { [weak self] quote in
            guard let self = self else { return }
            let vm = QuoteViewModel(quote: quote)
            let vc = QuoteViewController(viewModel: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
