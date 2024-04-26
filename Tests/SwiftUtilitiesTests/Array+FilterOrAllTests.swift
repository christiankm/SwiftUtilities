//
//  Array+FilterOrAllTests.swift
//
//
//  Created by Christian Mitteldorf on 26/04/2024.
//

import XCTest

final class Array_FilterOrAllTests: XCTestCase {

    func testFilterOrAll() throws {
        let someArray: [String] = [
            "AAPL",
            "COKE",
            "CAKE",
            "INTC",
            "SBUX"
        ]

        let sutFiltered = someArray.filterOrAll("ke")
        XCTAssertEqual(sutFiltered, ["COKE", "CAKE"])

        let sutEmptyFilter = someArray.filterOrAll("")
        XCTAssertEqual(sutEmptyFilter, ["AAPL", "COKE", "CAKE", "INTC", "SBUX"])

        let sutNoMatch = someArray.filterOrAll("mcd")
        XCTAssertEqual(sutNoMatch, [])
    }
}
