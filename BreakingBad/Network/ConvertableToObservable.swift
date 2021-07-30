//
//  ConvertableToObservable.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift

enum ConvertError: Error {
    case failed(Error)
    case network(NetworkError)
}

protocol ConvertableToObservable {
    func convertRequestToObservable<T: Decodable>(request: Request) -> Observable<T>
}

extension ConvertableToObservable {
    func convertRequestToObservable<T: Decodable>(request: Request) -> Observable<T> {
        return Observable.create { observer in
            Current.networkProvider.dataRequest(request) { result in
                switch result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let value = try decoder.decode(T.self, from: data)
                        observer.onNext(value)
                        observer.onCompleted()
                    } catch let error {
                        observer.onError(ConvertError.failed(error))
                    }
                case let .failure(error):
                    observer.onError(ConvertError.network(error))
                }
            }
            return Disposables.create()
        }
    }
}
