// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "versioning",
    platforms: [.iOS(.v13)],
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
