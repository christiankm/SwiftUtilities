//
//  LaunchArgumentTests.swift
//  SwiftUtilitiesTests
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import SwiftUtilities
import Testing

private enum TestLaunchArgument: String, LaunchArgument {
    case resetDatabase
    case disableAnimations
    case verboseLogging
}

@Suite("LaunchArgumentsController")
struct LaunchArgumentsControllerTests {

    // MARK: - Parsing from arguments array

    @Test func parsesEnabledArgumentFromRawArguments() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["resetDatabase"])
        #expect(sut.isEnabled(.resetDatabase))
    }

    @Test func doesNotEnableAbsentArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["resetDatabase"])
        #expect(!sut.isEnabled(.disableAnimations))
    }

    @Test func parsesMultipleArgumentsFromRawArguments() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(
            arguments: ["resetDatabase", "disableAnimations"]
        )
        #expect(sut.isEnabled(.resetDatabase))
        #expect(sut.isEnabled(.disableAnimations))
    }

    @Test func emptyArgumentsResultsInNoneEnabled() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        #expect(!sut.isEnabled(.resetDatabase))
        #expect(!sut.isEnabled(.disableAnimations))
    }

    @Test func unknownArgumentsAreIgnored() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["-unknownFlag", "otherThing"])
        #expect(!sut.isEnabled(.resetDatabase))
    }

    @Test func dashPrefixedArgumentDoesNotMatchRawValue() {
        // Enum raw values are plain strings (e.g. "resetDatabase"), so a dash-prefixed
        // variant ("-resetDatabase") must not be treated as a match.
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["-resetDatabase"])
        #expect(!sut.isEnabled(.resetDatabase))
    }

    // MARK: - Runtime enable / disable

    @Test func enableAddsArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        sut.enable(.verboseLogging)
        #expect(sut.isEnabled(.verboseLogging))
    }

    @Test func disableRemovesArgument() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: ["verboseLogging"])
        sut.disable(.verboseLogging)
        #expect(!sut.isEnabled(.verboseLogging))
    }

    @Test func disableOnNonEnabledArgumentDoesNothing() {
        let sut = LaunchArgumentsController<TestLaunchArgument>(arguments: [])
        sut.disable(.verboseLogging)
        #expect(!sut.isEnabled(.verboseLogging))
    }
}
