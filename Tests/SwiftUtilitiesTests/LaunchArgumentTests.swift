//
//  LaunchArgumentTests.swift
//  SwiftUtilitiesTests
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import SwiftUtilities
import XCTest

private enum TestLaunchArgument: String, LaunchArgumentType {
    case resetDatabase
    case disableAnimations
    case verboseLogging
}

final class LaunchArgumentTests: XCTestCase {

    // MARK: - Parsing from arguments array

    func testParsesEnabledArgumentFromRawArguments() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["resetDatabase"])
        XCTAssertTrue(sut.isEnabled(.resetDatabase))
    }

    func testDoesNotEnableAbsentArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["resetDatabase"])
        XCTAssertFalse(sut.isEnabled(.disableAnimations))
    }

    func testParsesMultipleArgumentsFromRawArguments() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(
            arguments: ["resetDatabase", "disableAnimations"]
        )
        XCTAssertTrue(sut.isEnabled(.resetDatabase))
        XCTAssertTrue(sut.isEnabled(.disableAnimations))
    }

    func testEmptyArgumentsResultsInNoneEnabled() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        XCTAssertFalse(sut.isEnabled(.resetDatabase))
        XCTAssertFalse(sut.isEnabled(.disableAnimations))
    }

    func testUnknownArgumentsAreIgnored() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["-unknownFlag", "otherThing"])
        XCTAssertFalse(sut.isEnabled(.resetDatabase))
    }

    func testDashPrefixedArgumentDoesNotMatchRawValue() {
        // Enum raw values are plain strings (e.g. "resetDatabase"), so a dash-prefixed
        // variant ("-resetDatabase") must not be treated as a match.
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["-resetDatabase"])
        XCTAssertFalse(sut.isEnabled(.resetDatabase))
    }

    // MARK: - Runtime enable / disable

    func testEnableAddsArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        sut.enable(.verboseLogging)
        XCTAssertTrue(sut.isEnabled(.verboseLogging))
    }

    func testDisableRemovesArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["verboseLogging"])
        sut.disable(.verboseLogging)
        XCTAssertFalse(sut.isEnabled(.verboseLogging))
    }

    func testDisableOnNonEnabledArgumentDoesNothing() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        sut.disable(.verboseLogging)
        XCTAssertFalse(sut.isEnabled(.verboseLogging))
    }
}
