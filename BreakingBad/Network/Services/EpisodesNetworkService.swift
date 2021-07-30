//
//  EpisodesNetworkService.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift

protocol EpisodesNetworkServiceProtocol {
    func perform() -> Observable<[Episode]>
}

final class EpisodesNetworkService: EpisodesNetworkServiceProtocol, ConvertableToObservable {
    func perform() -> Observable<[Episode]>  {
        convertRequestToObservable(request: EpisodesRequest())
    }
}
