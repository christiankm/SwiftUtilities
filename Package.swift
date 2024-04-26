// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUtilities",
    products: [
        .library(
            name: "SwiftUtilities",
            targets: ["SwiftUtilities"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUtilities",
            dependencies: []),
        .testTarget(
            name: "SwiftUtilitiesTests",
            dependencies: ["SwiftUtilities"]),
    ]
)
