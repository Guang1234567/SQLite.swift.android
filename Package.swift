// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SQLite_swift_android",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SQLite_swift_android",
            targets: ["SQLite_swift_android"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),

        .package(url: "https://github.com/Guang1234567/SwiftThreadLocal.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(name: "CBinding_SQLite_swift_android"),
        .target(
            name: "SQLite_swift_android",
            dependencies: ["CBinding_SQLite_swift_android", "SwiftThreadLocal"]),
        .testTarget(
            name: "SQLite_swift_androidTests",
            dependencies: ["SQLite_swift_android"]),
    ])
