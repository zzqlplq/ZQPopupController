// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZQPopupController",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "ZQPopupController",
            targets: ["ZQPopupController"]),
    ],
    targets: [
        .target(
            name: "ZQPopupController",
            path: "Sources",
            sources: ["ZQPopupController"]
        ),
    ]
)
