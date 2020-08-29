// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "GIO",
    products: [
        .library(name: "GIO", targets: ["GIO"]),
    ],
    dependencies: [
        .package(url: "ssh://promac.local/Users/rh/src/swift/rh/gtk/SwiftGObject", .branch("master"))
        //.package(url: "https://github.com/rhx/SwiftGObject.git", .branch("master"))
    ],
    targets: [
        .target(name: "GIO", dependencies: ["GLibObject"]),
        .testTarget(name: "GIOTests", dependencies: ["GIO"]),
    ]
)
