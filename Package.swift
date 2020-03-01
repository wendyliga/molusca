// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( 
    name: "Molusca",
    products: [
        .executable(name: "Molusca", targets: ["Molusca"]),
        .library(name: "XcodeTemplate", targets: ["XcodeTemplate"]),
        .library(name: "Explorer", targets: ["Explorer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wendyliga/ConsoleIO.git", from: "1.0.0"),
        .package(url: "https://github.com/wendyliga/SwiftKit.git", from: "1.0.0"),
        .package(url: "https://github.com/wendyliga/Explorer.git", from: "0.0.1"),
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.1")),
    ],
    targets: [
        .target(name: "Molusca", dependencies: ["SwiftKit", "XcodeTemplate", "ConsoleIO", "Explorer", "ArgumentParser"]),
        .target(name: "XcodeTemplate", dependencies: []),
        .target(name: "Explorer", dependencies: ["SwiftKit", "ConsoleIO"]),
        .testTarget(name: "MoluscaTests", dependencies: ["Molusca"]),
        .testTarget(name: "XcodeTemplateTests", dependencies: ["XcodeTemplate"]),
    ]
)
