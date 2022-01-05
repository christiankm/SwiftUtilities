//
//  Array+DifferenceTests.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import SwiftUtilities
import XCTest

class ArrayDifferenceTests: XCTestCase {

    func testDifferenceForEqualArraysReturnsEmpty() throws {
        let array1 = [
            "one",
            "two",
            "three"
        ]
        let array2 = [
            "one",
            "two",
            "three"
        ]

        let sut = array1.difference(from: array2)

        XCTAssertTrue(sut.isEmpty)
    }

    func testDifferenceForArraysReturnsDifference() throws {
        let array1 = ["1", "3", "4", "6", "8", "9"]
        let array2 = ["1", "2", "4", "7", "9"]

        let sut = array1.difference(from: array2)

        XCTAssertEqual(sut.sorted(), ["2", "3", "6", "7", "8"].sorted())
    }
}
