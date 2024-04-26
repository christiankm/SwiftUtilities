//
//  DateFormatterTests.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import SwiftUtilities
import XCTest

class DateFormatterTests: XCTestCase {

    func testMediumNoTimeFormatter() throws {
        let date = try XCTUnwrap(Date(day: 6, month: 7, year: 2018))
        let sut = DateFormatter.mediumNoTime(date)
        XCTAssertEqual(sut, "Jul 6, 2018")
    }

    func testLongNoTimeFormatter() throws {
        let date = try XCTUnwrap(Date(day: 6, month: 7, year: 2018))
        let sut = DateFormatter.longNoTime(date)
        XCTAssertEqual(sut, "July 6, 2018")
    }

    @available(iOS 13.0, *)
    func testFullRelativeFormatter() throws {
        let date = try XCTUnwrap(Date(day: 6, month: 7, year: 2018))
        let sut = RelativeDateTimeFormatter.full(date, relativeTo: Date(day: 6, month: 7, year: 2021)!)
        XCTAssertEqual(sut, "3 years ago")
    }
}
