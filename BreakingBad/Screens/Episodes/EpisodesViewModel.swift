//
//  EpisodesViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 28/07/2021.
//

import RxCocoa
import RxSwift

final class EpisodesViewModel {

    struct Input {
        let ready = PublishSubject<Void>()
    }

    struct Output {
        let state: Driver<State>
        let loading: Driver<Bool>
    }

    struct State: Equatable {
        let rows: [Row]
    }

    enum Row: Equatable {
        case episode(Episode)

        var viewState: EpisodesTableViewCell.ViewState {
            switch self {
            case let .episode(episode):
                return .init(
                    title: episode.title,
                    season: "Season: \(episode.season)",
                    episode: "Episode: \(episode.episode)"
                )
            }
        }
    }

    let input = Input()
    let output: Output

    private let state = PublishSubject<State>()
    private let loading = PublishSubject<Bool>()
    private let disposeBag = DisposeBag()
    private let service: EpisodesNetworkServiceProtocol

    init(service: EpisodesNetworkServiceProtocol = EpisodesNetworkService()) {
        self.service = service
        output = Output(
            state: state.asDriver(onErrorJustReturn: .init(rows: [])),
            loading: loading.asDriver(onErrorDriveWith: .never())
        )

        input.ready
            .do(onNext: { [unowned self] in
                self.loading.onNext(true)
            })
            .flatMap {
                service.perform()
            }
            .observe(on: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] episodes in
                guard let self = self else {
                    return
                }
                self.loading.onNext(false)
                let rows = self.rows(for: episodes)
                self.state.onNext(State(rows: rows))
            }, onError: { _ in
                self.loading.onNext(false)
                // TODO: Error handling
                self.state.onNext(State(rows: []))
            })
            .disposed(by: disposeBag)
    }

    private func rows(for episodes: [Episode]) -> [Row] {
        episodes.map { .episode($0) }
    }
}
