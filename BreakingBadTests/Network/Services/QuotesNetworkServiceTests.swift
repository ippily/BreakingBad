//
//  QuotesNetworkServiceTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift
import XCTest
@testable import BreakingBad

class QuotesNetworkServiceTests: XCTestCase {

    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    override func tearDown() {
        super.tearDown()

        disposeBag = nil
    }

    func testEpisodeNetworkServiceFailure() {
        let sut = QuotesNetworkServiceMock(quotes: nil)
        let expectation = expectation(description: "Request should fail")

        sut.perform()
            .subscribe(onNext: { _ in
                XCTFail()
            }) { _ in
                expectation.fulfill()
            }
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testEpisodeNetworkServiceSuccess() {
        let sut = QuotesNetworkServiceMock(quotes: Quote.mockQuotes)
        let expectation = expectation(description: "Request should succeed")

        sut.perform()
            .subscribe(onNext: { quotes in
                XCTAssertEqual(quotes, Quote.mockQuotes)
                expectation.fulfill()
            }) { _ in
                XCTFail()
            }
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 1, handler: nil)
    }
}
