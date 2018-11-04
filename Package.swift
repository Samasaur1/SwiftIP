// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "SwiftIP",
    products: [
        .library(name: "SwiftIP", targets: ["SwiftIP"]),
    ],
    targets: [
        .target(name: "SwiftIP", dependencies: []),
        .testTarget(name: "SwiftIPTests", dependencies: ["SwiftIP"]),
    ]
)
