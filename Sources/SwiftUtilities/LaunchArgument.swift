//
//  LaunchArgument.swift
//
//
//  Created by Christian Mitteldorf on 03/03/2026.
//

import Foundation

/// A protocol that describes a type used as a launch argument.
///
/// Conform an enum whose `RawValue` is `String` to `LaunchArgument` and pass it to
/// `LaunchArgumentsController` for type-safe argument parsing.
///
/// ```swift
/// enum AppLaunchArgument: String, LaunchArgument {
///     case resetDatabase
///     case disableAnimations
/// }
/// ```
public protocol LaunchArgument: RawRepresentable, Hashable where RawValue == String {}
