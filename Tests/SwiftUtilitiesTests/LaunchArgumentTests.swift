//
//  LaunchArgumentTests.swift
//  SwiftUtilitiesTests
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import SwiftUtilities
import XCTest

final class LaunchArgumentTests: XCTestCase {

    // MARK: - LaunchArgument

    func testLaunchArgumentIsTrueWhenKeyIsPresent() {
        @LaunchArgument("-resetDatabase", arguments: ["-resetDatabase", "-disableAnimations"])
        var sut: Bool
        XCTAssertTrue(sut)
    }

    func testLaunchArgumentIsFalseWhenKeyIsAbsent() {
        @LaunchArgument("-resetDatabase", arguments: ["-disableAnimations"])
        var sut: Bool
        XCTAssertFalse(sut)
    }

    func testLaunchArgumentIsFalseWhenArgumentsListIsEmpty() {
        @LaunchArgument("-resetDatabase", arguments: [])
        var sut: Bool
        XCTAssertFalse(sut)
    }

    // MARK: - LaunchArgumentValue

    func testLaunchArgumentValueReturnsStoredValue() {
        let userDefaults = UserDefaults(suiteName: #function)!
        userDefaults.set("https://staging.example.com", forKey: "serverURL")

        @LaunchArgumentValue("serverURL", defaultValue: "https://api.example.com", userDefaults: userDefaults)
        var sut: String
        XCTAssertEqual(sut, "https://staging.example.com")

        userDefaults.removePersistentDomain(forName: #function)
    }

    func testLaunchArgumentValueReturnsDefaultValueWhenKeyIsAbsent() {
        let userDefaults = UserDefaults(suiteName: #function)!

        @LaunchArgumentValue("serverURL", defaultValue: "https://api.example.com", userDefaults: userDefaults)
        var sut: String
        XCTAssertEqual(sut, "https://api.example.com")

        userDefaults.removePersistentDomain(forName: #function)
    }

    func testLaunchArgumentValueWithIntegerType() {
        let userDefaults = UserDefaults(suiteName: #function)!
        userDefaults.set(5, forKey: "maxRetries")

        @LaunchArgumentValue("maxRetries", defaultValue: 3, userDefaults: userDefaults)
        var sut: Int
        XCTAssertEqual(sut, 5)

        userDefaults.removePersistentDomain(forName: #function)
    }

    func testLaunchArgumentValueWithIntegerDefaultValue() {
        let userDefaults = UserDefaults(suiteName: #function)!

        @LaunchArgumentValue("maxRetries", defaultValue: 3, userDefaults: userDefaults)
        var sut: Int
        XCTAssertEqual(sut, 3)

        userDefaults.removePersistentDomain(forName: #function)
    }
}
