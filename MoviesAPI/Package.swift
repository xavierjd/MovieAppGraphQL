// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "MoviesAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "MoviesAPI", targets: ["MoviesAPI"]),
    .library(name: "MoviesAPITestMocks", targets: ["MoviesAPITestMocks"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "MoviesAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "MoviesAPITestMocks",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "MoviesAPI"),
      ],
      path: "./MoviesAPITestMocks"
    ),
  ]
)
