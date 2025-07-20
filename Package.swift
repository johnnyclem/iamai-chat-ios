// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "IamAIChat",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "IamAIChat", targets: ["IamAIChat"])
    ],
    dependencies: [
        // Placeholder dependencies; integrate actual packages when available
    ],
    targets: [
        .target(
            name: "IamAIChatC",
            path: "Sources/IamAIChatC",
            publicHeadersPath: "include"
        ),
        .target(
            name: "IamAIChat",
            dependencies: ["IamAIChatC"],
            path: "Sources/IamAIChat"
        ),
        .testTarget(
            name: "IamAIChatTests",
            dependencies: ["IamAIChat"],
            path: "Tests"
        )
    ]
)
