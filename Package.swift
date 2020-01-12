// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( 
    name: "Molusca",
    products: [
        .executable(name: "Molusca", targets: ["Molusca"]),
        .library(name: "SwiftKit", targets: ["SwiftKit"]),
        .library(name: "XcodeTemplate", targets: ["XcodeTemplate"]),
        .library(name: "Explorer", targets: ["Explorer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wendyliga/ConsoleIO.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "Molusca", dependencies: ["SwiftKit", "XcodeTemplate", "ConsoleIO", "Explorer"]),
        .target(name: "SwiftKit", dependencies: []),
        .target(name: "XcodeTemplate", dependencies: []),
        .target(name: "Explorer", dependencies: ["SwiftKit"]),
        .testTarget(name: "MoluscaTests", dependencies: ["Molusca"]),
        .testTarget(name: "SwiftKitTests", dependencies: ["SwiftKit"]),
        .testTarget(name: "XcodeTemplateTests", dependencies: ["XcodeTemplate"]),
    ]
)
