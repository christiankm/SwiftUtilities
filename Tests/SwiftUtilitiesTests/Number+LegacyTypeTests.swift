//
//  Number+LegacyTypeTests.swift
//  
//
//  Created by Christian Mitteldorf on 23/10/2021.
//

import SwiftUtilities
import XCTest

class NumberLegacyTypeTests: XCTestCase {

    func testDecimalAsDecimalNumber() throws {
        XCTAssertEqual(Decimal(10.43).asDecimalNumber, NSDecimalNumber(10.43))
    }

    func testIntAsNumber() throws {
        XCTAssertEqual(Int(11).asNumber, NSNumber(value: 11))
    }

    func testDoubleAsNumber() throws {
        XCTAssertEqual(Double(12.45).asNumber, NSNumber(value: 12.45))
    }
}
