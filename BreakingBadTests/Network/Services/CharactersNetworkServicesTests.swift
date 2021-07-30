//
//  CharactersNetworkServicesTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import RxSwift
import XCTest
@testable import BreakingBad

class CharacterNetworkServicesTests: XCTestCase {

    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    override func tearDown() {
        super.tearDown()

        disposeBag = nil
    }

    func testCharacterNetworkServiceFailure() {
        let sut = CharacterNetworkServiceMock(characters: nil)
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

    func testCharacterNetworkServiceSuccess() {
        let sut = CharacterNetworkServiceMock(characters: Character.mockCharacters)
        let expectation = expectation(description: "Request should succeed")

        sut.perform()
            .subscribe(onNext: { characters in
                XCTAssertEqual(characters, Character.mockCharacters)
                expectation.fulfill()
            }) { _ in
                XCTFail()
            }
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 1, handler: nil)
    }
}
