// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "LocationTiq",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
    ],
    products: [ .library(name: "LocationTiq", targets: ["LocationTiq"]) ],
    dependencies: [
    ],
    targets: [
        .target(name: "LocationTiq", resources: [.process("Resources")]),
        .testTarget(name: "LocationTiqTests", dependencies: ["LocationTiq"])
    ]
)
