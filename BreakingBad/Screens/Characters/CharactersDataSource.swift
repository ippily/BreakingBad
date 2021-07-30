//
//  CharactersDataSource.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import RxCocoa
import RxSwift
import UIKit

final class CharactersDataSource: NSObject, RxTableViewDataSourceType, UITableViewDataSource {

    typealias Element = [CharactersViewModel.Row]
    var elements: Element = []

    var characterSelected: ((Character) -> Void)?

    // MARK: RxTableViewDataSourceType

    func tableView(_ tableView: UITableView, observedEvent: Event<[CharactersViewModel.Row]>) {
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
        case .character:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterTableViewCell.self), for: indexPath) as? CharacterTableViewCell else {
                return UITableViewCell()
            }

            cell.setViewState(row.viewState)
            return cell
        }
    }
}

extension CharactersDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = elements[safe: indexPath.row] else {
            return
        }
        switch row {
        case let .character(character):
            characterSelected?(character)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
