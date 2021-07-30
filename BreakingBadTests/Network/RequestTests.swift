//
//  RequestTests.swift
//  BreakingBadTests
//
//  Created by Emily Ip on 29/07/2021.
//

import Foundation
import XCTest
@testable import BreakingBad

class RequestTests: XCTestCase {

    func testRequest() {
        let sut = RequestMock()
        XCTAssertEqual(sut.baseEndpoint, .base)
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.pathComponents, ["test"])
        XCTAssertEqual(try? sut.asURLRequest().url, URL(string: "https://www.breakingbadapi.com/test"))
    }

    func testCharactersRequest() {
        let sut = CharactersRequest()
        XCTAssertEqual(sut.baseEndpoint, .base)
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.pathComponents, ["api", "characters"])
        XCTAssertEqual(try? sut.asURLRequest().url, URL(string: "https://www.breakingbadapi.com/api/characters"))
    }

    func testEpisodesRequest() {
        let sut = EpisodesRequest()
        XCTAssertEqual(sut.baseEndpoint, .base)
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.pathComponents, ["api", "episodes"])
        XCTAssertEqual(try? sut.asURLRequest().url, URL(string: "https://www.breakingbadapi.com/api/episodes"))
    }

    func testQuotesRequest() {
        let sut = QuotesRequest()
        XCTAssertEqual(sut.baseEndpoint, .base)
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.pathComponents, ["api", "quotes"])
        XCTAssertEqual(try? sut.asURLRequest().url, URL(string: "https://www.breakingbadapi.com/api/quotes"))
    }
}
