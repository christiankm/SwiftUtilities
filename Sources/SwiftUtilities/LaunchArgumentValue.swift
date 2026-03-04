//
//  LaunchArgumentValue.swift
//
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import Foundation

/// A controller that parses and manages type-safe launch arguments.
///
/// Define your launch arguments as a `String`-backed enum conforming to `LaunchArgumentType`,
/// then create a controller instance. Arguments parsed from `CommandLine.arguments` at
/// initialisation time are immediately available, and you can also enable or disable arguments
/// at run-time.
///
/// ```swift
/// enum AppLaunchArgument: String, LaunchArgumentType {
///     case resetDatabase
///     case disableAnimations
/// }
///
/// let arguments = LaunchArgumentsController<AppLaunchArgument>()
///
/// if arguments.isEnabled(.resetDatabase) {
///     // Perform database reset
/// }
/// ```
public class LaunchArgumentsController<T: LaunchArgumentType>: @unchecked Sendable {

    private var storage = Set<T>()
    private let lock = NSLock()

    /// Creates a controller by parsing the supplied argument strings.
    ///
    /// - Parameter arguments: The raw argument strings to parse. Defaults to `CommandLine.arguments`.
    public init(arguments: [String] = CommandLine.arguments) {
        for argument in arguments {
            guard let launchArgument = T(rawValue: argument) else { continue }
            storage.insert(launchArgument)
        }
    }

    /// Enables a launch argument at run-time.
    public func enable(_ launchArgument: T) {
        lock.withLock { storage.insert(launchArgument) }
    }

    /// Disables a launch argument at run-time.
    public func disable(_ launchArgument: T) {
        lock.withLock { storage.remove(launchArgument) }
    }

    /// Returns `true` if the given launch argument is currently enabled.
    public func isEnabled(_ launchArgument: T) -> Bool {
        lock.withLock { storage.contains(launchArgument) }
    }
}
