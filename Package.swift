// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "versioning",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .watchOS(.v5),
        .tvOS(.v12),
    ],
    products: [
        .library(
            name: "Versioning",
            targets: ["Versioning"]),
    ],
    targets: [
        .target(
            name: "Versioning"),
        .testTarget(
            name: "VersioningTests",
            dependencies: ["Versioning"]
        ),
    ]
)
