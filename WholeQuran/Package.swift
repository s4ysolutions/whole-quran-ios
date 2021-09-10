// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WholeQuran",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WholeQuran",
            targets: ["WholeQuran"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
//        Showing All Messages
//        dependency 'FlatBuffers' in target 'WholeQuranTests' requires explicit declaration; provide the name of the package dependency with '.package(name: "FlatBuffers", url: "https://github.com/mustiikhalil/flatbuffers.git", from: "2.0.0")'
//

        .package(name: "FlatBuffers", url: "https://github.com/mustiikhalil/flatbuffers.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WholeQuran",
            dependencies: [
                .byName(name: "FlatBuffers")
            ],
            resources: [
                .process("Assets.xcassets")
            ]),
        .testTarget(
            name: "WholeQuranTests",
            dependencies: ["WholeQuran", "FlatBuffers"]),
    ]
)
