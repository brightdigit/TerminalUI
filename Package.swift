// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TerminalUI",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "TerminalUI",
      targets: ["TerminalUI"]
    ),
    .executable(name: "termuidemo", targets: ["termuidemo"])
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/shibapm/Komondor.git", from: "1.0.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "TerminalUI",
      dependencies: []
    ),
    .testTarget(
      name: "TerminalUITests",
      dependencies: ["TerminalUI"]
    ),
    .target(name: "termuidemo", dependencies: ["TerminalUI"])
  ]
)

#if canImport(PackageConfig)
    import PackageConfig

    let config = PackageConfig([
        "komondor": [
            "pre-push": "swift test",
            "pre-commit": [
                "swift test",
                "swiftlint autocorrect && swiftformat .",
                "swiftformat --lint . && swiftlint",
                "git add .",
            ],
        ],
    ]).write()
#endif
