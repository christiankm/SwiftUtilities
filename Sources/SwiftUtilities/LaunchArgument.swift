//
//  LaunchArgument.swift
//
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import Foundation

/// A property wrapper that provides type-safe access to a boolean launch argument flag.
///
/// A flag is considered active when its key is present in the process arguments.
///
/// Usage:
/// ```swift
/// struct LaunchArguments {
///     @LaunchArgument("-resetDatabase")
///     static var resetDatabase: Bool
///
///     @LaunchArgument("-disableAnimations")
///     static var disableAnimations: Bool
/// }
///
/// if LaunchArguments.resetDatabase {
///     // Reset the database
/// }
/// ```
@propertyWrapper
public struct LaunchArgument {

    public let key: String
    private let arguments: [String]

    public init(_ key: String, arguments: [String] = ProcessInfo.processInfo.arguments) {
        self.key = key
        self.arguments = arguments
    }

    public var wrappedValue: Bool {
        arguments.contains(key)
    }
}
