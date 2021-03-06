// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-color-detector",
    products: [
        .executable(name:"swift-color-detector", targets: ["swift-color-detector"]),
        .library(name: "SwiftColorDetectKit", targets: ["SwiftColorDetectKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: Version(0, 50000, 0)),
        .package(url: "https://github.com/yutailang0119/FileScanKit.git", from: Version(0, 1, 0)),
    ],
    targets: [
        .target(name: "swift-color-detector",
                dependencies: ["SwiftColorDetectKit", "FileScanKit",]),
        .target(name: "SwiftColorDetectKit",
                dependencies: ["SwiftSyntax", "FileScanKit",]),
        .testTarget(name: "SwiftColorDetectKitTests", dependencies: ["SwiftColorDetectKit"]),
    ]
)
