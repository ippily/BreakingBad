//
//  NetworkProviderTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import XCTest
@testable import BreakingBad

class NetworkProviderTests: XCTestCase {

    func testDataSuccess() {
        let expectation = expectation(description: "Data should be fetched")
        let sut = NetworkProviderSuccessMock()

        sut.dataRequest(RequestMock()) { result in
            switch result {
            case .failure:
                XCTFail()
            case let .success(data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testDataFailure() {
        let expectation = expectation(description: "Provider should fail")
        let sut = NetworkProviderFailureMock()

        sut.dataRequest(RequestMock()) { result in
            switch result {
            case .failure:
                expectation.fulfill()
            case .success:
                XCTFail()
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
