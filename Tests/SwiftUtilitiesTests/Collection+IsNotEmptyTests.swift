//
//  Collection+IsNotEmptyTests.swift
//  
//
//  Created by Christian Mitteldorf on 26/04/2024.
//

import SwiftUtilities
import XCTest

final class Collection_IsNotEmptyTests: XCTestCase {

    func testIsNotEmpty() throws {
        let emptyArray: [String] = []
        XCTAssertFalse(emptyArray.isNotEmpty)

        let someArray: [String] = ["This", "is", "not", "empty"]
        XCTAssertTrue(someArray.isNotEmpty)
    }
}
