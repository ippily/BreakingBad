//
//  EpisodesTableViewCell.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    struct ViewState: Equatable {
        let title: String
        let season: String
        let episode: String
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var season: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()

    private lazy var episode: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()

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
        contentView.addSubview(stackView)

        [title, season, episode].forEach { stackView.addArrangedSubview($0) }

        let trailing = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        let leading = stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let centerY = stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        layout([trailing, leading, centerY])
    }
}

extension EpisodesTableViewCell {
    func setViewState(_ state: ViewState) {
        title.text = state.title
        season.text = state.season
        episode.text = state.episode
    }
}
