//
//  QuotesDataSource.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class QuotesDataSource: NSObject, RxTableViewDataSourceType, UITableViewDataSource {

    typealias Element = [QuotesViewModel.Row]
    var elements: Element = []

    var quoteSelected: ((Quote) -> Void)?

    // MARK: RxTableViewDataSourceType

    func tableView(_ tableView: UITableView, observedEvent: Event<[QuotesViewModel.Row]>) {
        switch observedEvent {
        case let .next(updatedElements):
            elements = updatedElements
        case .error, .completed:
            break
        }

        tableView.reloadData()
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = elements[safe: indexPath.item] else {
            return UITableViewCell()
        }

        switch row {
        case .quote:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuotesTableViewCell.self), for: indexPath) as? QuotesTableViewCell else {
                return UITableViewCell()
            }

            cell.setViewState(row.viewState)
            return cell
        }
    }
}

extension QuotesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = elements[safe: indexPath.row] else {
            return
        }
        switch row {
        case let .quote(quote):
            quoteSelected?(quote)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
