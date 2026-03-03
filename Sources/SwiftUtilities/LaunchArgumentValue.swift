//
//  LaunchArgumentValue.swift
//
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import Foundation

/// A property wrapper that provides type-safe access to a typed launch argument value.
///
/// Values are passed as launch arguments using the `-key value` convention,
/// which makes them accessible via `UserDefaults`. When the app is launched with
/// `-serverURL https://api.example.com` as a launch argument, you can read the
/// value in a type-safe manner using this property wrapper.
///
/// Usage:
/// ```swift
/// struct LaunchArguments {
///     @LaunchArgumentValue("-serverURL", defaultValue: "https://api.example.com")
///     static var serverURL: String
///
///     @LaunchArgumentValue("-maxRetries", defaultValue: 3)
///     static var maxRetries: Int
/// }
///
/// let url = LaunchArguments.serverURL
/// ```
@propertyWrapper
public struct LaunchArgumentValue<T> {

    public let key: String
    public let defaultValue: T
    private let userDefaults: UserDefaults

    public init(_ key: String, defaultValue: T, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }

    public var wrappedValue: T {
        userDefaults.object(forKey: key) as? T ?? defaultValue
    }
}
