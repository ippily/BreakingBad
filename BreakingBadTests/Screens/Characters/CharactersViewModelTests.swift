//
//  CharactersViewModelTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 28/07/2021.
//

import Foundation
import RxSwift
import XCTest
@testable import BreakingBad

class CharactersViewModelTests: XCTestCase {

    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    override func tearDown() {
        super.tearDown()

        disposeBag = nil
    }

    func testOuputSuccess() {
        let service = CharacterNetworkServiceMock(characters: Character.mockCharacters)
        let sut = CharactersViewModel(service: service)
        let expectation = expectation(description: "State should be updated with rows")

        sut.output
            .state
            .map{ $0.rows }
            .drive { rows in
                XCTAssertTrue(rows.count == 3)
                expectation.fulfill()
            }
            .disposed(by: disposeBag)

        sut.input.ready.onNext(())
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testOuputFailure() {
        let service = CharacterNetworkServiceMock(characters: nil)
        let sut = CharactersViewModel(service: service)
        let expectation = expectation(description: "State should be updated with no rows")

        sut.output
            .state
            .map { $0.rows }
            .drive { rows in
                XCTAssertTrue(rows.isEmpty)
                expectation.fulfill()
        }
        .disposed(by: disposeBag)

        sut.input.ready.onNext(())
        waitForExpectations(timeout: 1, handler: nil)
    }
}
