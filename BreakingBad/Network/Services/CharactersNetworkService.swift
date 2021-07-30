//
//  CharactersNetworkService.swift
//  BreakingBad
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift

protocol CharactersNetworkServiceProtocol {
    func perform() -> Observable<[Character]>
}

final class CharactersNetworkService: CharactersNetworkServiceProtocol, ConvertableToObservable {
    func perform() -> Observable<[Character]> {
        convertRequestToObservable(request: CharactersRequest())
    }
}
