//
//  PercentageClampedTests.swift
//  
//
//  Created by Christian Mitteldorf on 23/10/2021.
//

import SwiftUtilities
import XCTest

class PercentageClampedTests: XCTestCase {

    func testClampingToPercentage() throws {
        @PercentageClamped var sut = 0.0
        XCTAssertEqual(sut, 0.0)

        sut = 0.5
        XCTAssertEqual(sut, 0.5)

        sut = 1.0
        XCTAssertEqual(sut, 1.0)

        sut = 10.0
        XCTAssertEqual(sut, 1.0)

        sut = -0.5
        XCTAssertEqual(sut, 0.0)
    }
}
