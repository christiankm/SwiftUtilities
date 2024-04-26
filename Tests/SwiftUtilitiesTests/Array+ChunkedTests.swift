//
//  Array+ChunkedTests.swift
//  SwiftUtilitiesTests
//
//  Created by Christian Mitteldorf on 26/04/2024.
//

import SwiftUtilities
import XCTest

final class Array_Chunked: XCTestCase {

    func testChunked() throws {
        let sutEven = [1, 2, 3, 4, 5, 6, 7, 8]
        XCTAssertEqual(sutEven.chunked(into: 2), [
            [1, 2],
            [3, 4],
            [5, 6],
            [7, 8]
        ])

        let sutOdd = ["This", "is", "an", "array", "of", "odd", "size"]
        XCTAssertEqual(sutOdd.chunked(into: 3), [
            ["This", "is", "an"],
            ["array", "of", "odd"],
            ["size"]
        ])
    }
}
