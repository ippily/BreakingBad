//
//  QuotesNetworkService.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift

protocol QuotesNetworkServiceProtocol {
    func perform() -> Observable<[Quote]>
}

final class QuotesNetworkService: QuotesNetworkServiceProtocol, ConvertableToObservable {
    func perform() -> Observable<[Quote]>  {
        convertRequestToObservable(request: QuotesRequest())
    }
}
