//
//  CharactersViewModel.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import RxCocoa
import RxSwift

final class CharactersViewModel {

    struct Input {
        let ready = PublishSubject<Void>()
        let characterTapped = PublishSubject<Void>()
    }

    struct Output {
        let state: Driver<State>
        let loading: Driver<Bool>
    }

    struct State: Equatable {
        let rows: [Row]
    }

    enum Row: Equatable {
        case character(Character)

        var viewState: CharacterTableViewCell.ViewState {
            switch self {
            case let .character(character):
                return .init(title: character.name)
            }
        }
    }
    
    let input = Input()
    let output: Output

    private let state = PublishSubject<State>()
    private let loading = PublishSubject<Bool>()
    private let disposeBag = DisposeBag()
    private let service: CharactersNetworkServiceProtocol

    init(service: CharactersNetworkServiceProtocol = CharactersNetworkService()) {
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
            .subscribe(onNext: { [weak self] characters in
                guard let self = self else {
                    return
                }
                self.loading.onNext(false)
                let rows = self.rows(for: characters)
                self.state.onNext(State(rows: rows))
            }, onError: { _ in
                self.loading.onNext(false)
                // TODO: Error handling
                self.state.onNext(State(rows: []))
            })
            .disposed(by: disposeBag)
    }

    private func rows(for characters: [Character]) -> [Row] {
        characters.map { .character($0) }
    }
}
