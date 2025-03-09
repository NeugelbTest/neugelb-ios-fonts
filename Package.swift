// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "NeugelbFonts",
    platforms: [
      .iOS(.v11)
    ],
    products: [
        .library(
            name: "NeugelbFonts",
            targets: ["NeugelbFonts"])
    ],
    targets: [
        .target(
            name: "NeugelbFonts",
            resources: [.process("Fonts")]
        ),
        .testTarget(
            name: "NeugelbFontsTests",
            dependencies: ["NeugelbFonts"]
        )
    ]
)
