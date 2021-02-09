// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "shiny-lang",
    dependencies: [],
    targets: [
        .target(name: "Shiny", dependencies: ["Driver"]),
        .target(name: "Driver", dependencies: ["Support"]),
        .target(name: "Syntax", dependencies: ["Support"]),
        .target(name: "Support")
    ]
)
