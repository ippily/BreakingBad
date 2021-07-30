//
//  QuotesViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import RxCocoa
import RxSwift

final class QuotesViewModel {

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
        case quote(Quote)

        var viewState: QuotesTableViewCell.ViewState {
            switch self {
            case let .quote(quote):
                return .init(title: quote.quote)
            }
        }
    }

    let input = Input()
    let output: Output

    private let state = PublishSubject<State>()
    private let loading = PublishSubject<Bool>()
    private let disposeBag = DisposeBag()
    private let service: QuotesNetworkServiceProtocol

    init(service: QuotesNetworkServiceProtocol = QuotesNetworkService()) {
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
            .subscribe(onNext: { [weak self] quotes in
                guard let self = self else {
                    return
                }
                self.loading.onNext(false)
                let rows = self.rows(for: quotes)
                self.state.onNext(State(rows: rows))
            }, onError: { _ in
                self.loading.onNext(false)
                // TODO: Error handling
                self.state.onNext(State(rows: []))
            })
            .disposed(by: disposeBag)
    }

    private func rows(for quotes: [Quote]) -> [Row] {
        quotes.map { return .quote($0) }
    }
}
