//
//  EpisodesViewModelTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift
import XCTest
@testable import BreakingBad

class EpisodesViewModelTests: XCTestCase {

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
        let service = EpisodesNetworkServiceMock(episodes: Episode.mockEpisodes)
        let sut = EpisodesViewModel(service: service)
        let expectation = expectation(description: "State should be updated with rows")

        sut.output
            .state
            .map{ $0.rows }
            .drive { rows in
                XCTAssertTrue(rows.count == 2)
                expectation.fulfill()
            }
            .disposed(by: disposeBag)

        sut.input.ready.onNext(())
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testOuputFailure() {
        let service = EpisodesNetworkServiceMock(episodes: nil)
        let sut = EpisodesViewModel(service: service)
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
