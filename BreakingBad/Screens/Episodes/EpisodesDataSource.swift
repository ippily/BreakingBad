//
//  EpisodesDatasource.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import RxCocoa
import RxSwift
import UIKit

final class EpisodesDataSource: NSObject, RxTableViewDataSourceType, UITableViewDataSource {

    typealias Element = [EpisodesViewModel.Row]
    var elements: Element = []

    var episodeSelected: ((Episode) -> Void)?

    // MARK: RxTableViewDataSourceType

    func tableView(_ tableView: UITableView, observedEvent: Event<[EpisodesViewModel.Row]>) {
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
        case .episode:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodesTableViewCell.self), for: indexPath) as? EpisodesTableViewCell else {
                return UITableViewCell()
            }

            cell.setViewState(row.viewState)
            return cell
        }
    }
}

extension EpisodesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = elements[safe: indexPath.row] else {
            return
        }
        switch row {
        case let .episode(episode):
            episodeSelected?(episode)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
