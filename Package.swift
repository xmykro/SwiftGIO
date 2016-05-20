import PackageDescription

let package = Package(
    name: "GIO",
    dependencies: [
        .Package(url: "https://github.com/rhx/SwiftGLib.git", majorVersion: 2)
    ]
)
