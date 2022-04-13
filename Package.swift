// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "CUsbmuxd",
    products: [
        .library(
            name: "CUsbmuxd",
            targets: ["CUsbmuxd"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Schlaubischlump/CPlist", from: "0.0.1"),
        .package(url: "https://github.com/Schlaubischlump/CImobileDeviceGlue", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "CUsbmuxd",
            dependencies: ["CPlist", "CImobileDeviceGlue"],
            path: "Sources/libusbmuxd/",
            exclude: [
                "tools",
                "docs",
                "m4",
            ],
            sources: [
                "src/libusbmuxd.c",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("PACKAGE_STRING=\"libusbmuxd 1.0.0\""),
                .define("HAVE_STPNCPY")
            ]
        )
    ]
)
