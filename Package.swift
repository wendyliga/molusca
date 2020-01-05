// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( 
    name: "Molusca",
    products: [
        .executable(name: "Molusca", targets: ["Molusca"]),
        .library(name: "MoluscaHelper", targets: ["MoluscaHelper"]),
        .library(name: "XcodeTemplate", targets: ["XcodeTemplate"]),
    ],
    targets: [
        .target(name: "Molusca", dependencies: ["MoluscaHelper", "XcodeTemplate"]),
        .target(name: "MoluscaHelper", dependencies: []),
        .target(name: "XcodeTemplate", dependencies: []),
        .testTarget(name: "MoluscaTests", dependencies: ["Molusca"]),
        .testTarget(name: "MoluscaHelperTests", dependencies: ["MoluscaHelper"]),
        .testTarget(name: "XcodeTemplateTests", dependencies: ["XcodeTemplate"]),
    ]
)
