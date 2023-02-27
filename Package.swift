// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Firebase",
    platforms: [.iOS(.v13), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v7)],
    products: [
        .library(
            name: "FirebaseAnalytics",
            targets: ["FirebaseAnalyticsTarget"]
        ),
        .library(
            name: "FirebaseAuth",
            targets: ["FirebaseAuthTarget"]
        ),
        .library(
            name: "FirebaseCrashlytics",
            targets: ["FirebaseCrashlyticsTarget"]
        ),
        .library(
            name: "FirebaseDatabase",
            targets: ["FirebaseDatabaseTarget"]
        ),
        .library(
            name: "FirebaseDynamicLinks",
            targets: ["FirebaseDynamicLinksTarget"]
        ),
        .library(
            name: "FirebaseInstallations",
            targets: ["FirebaseInstallationsTarget"]
        ),
        .library(
            name: "FirebasePerformance",
            targets: ["FirebasePerformanceTarget"]
        ),
        .library(
            name: "FirebaseRemoteConfig",
            targets: ["FirebaseRemoteConfigTarget"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Firebase",
            publicHeadersPath: "./"
        ),
        .target(
            name: "FirebaseAnalyticsTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalytics",
                "FirebaseCore",
                "FirebaseCoreDiagnostics",
                "FirebaseInstallations",
                "GoogleAppMeasurement",
                "GoogleAppMeasurementIdentitySupport",
                "GoogleDataTransport",
                "GoogleUtilities",
                "PromisesObjC",
                "nanopb"
            ],
            path: "Sources/FirebaseAnalytics"
        ),
        .target(
            name: "FirebaseAuthTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseAuth",
                "GTMSessionFetcher"
            ],
            path: "Sources/FirebaseAuth"
        ),
        .target(
            name: "FirebaseCrashlyticsTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseCrashlytics"
            ],
            path: "Sources/FirebaseCrashlytics",
            exclude: [
                "run",
                "upload-symbols"
            ]
        ),
        .target(
            name: "FirebaseDatabaseTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseDatabase",
                "leveldb-library"
            ],
            path: "Sources/FirebaseDatabase"
        ),
        .target(
            name: "FirebaseDynamicLinksTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
            ],
            path: "Sources/FirebaseDynamicLinks"
        ),
        .target(
            name: "FirebaseInstallationsTarget",
            dependencies: [
                "Firebase",
                "FirebaseInstallations",
            ],
            path: "Sources/FirebaseInstallations"
        ),
        .target(
            name: "FirebasePerformanceTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseABTesting",
                .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
                "FirebaseRemoteConfig"
            ],
            path: "Sources/FirebasePerformance",
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .target(
            name: "FirebaseRemoteConfigTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseABTesting",
                "FirebaseRemoteConfig"
            ],
            path: "Sources/FirebaseRemoteConfig",
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .binaryTarget(
            name: "FirebaseABTesting",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseABTesting.xcframework.zip",
            checksum: "0cfe97fce76a313ad5ee7d38e52306856688a740e588f57d224dd8bfa00788d1"
        ),
        .binaryTarget(
            name: "FirebaseAnalytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseAnalytics.xcframework.zip",
            checksum: "42ac890e2e9cce4d24fd78a95fab0d7f626a8cb5fde8ff3011e5d336a776b80b"
        ),
        .binaryTarget(
            name: "FirebaseAuth",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseAuth.xcframework.zip",
            checksum: "86f904aa9d953f0f8536565e6347ccfeb35a9f37fe6599a4758d97c7431c7fb3"
        ),
        .binaryTarget(
            name: "FirebaseCore",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseCore.xcframework.zip",
            checksum: "4388e4f2b575c2e9cd91c7a58337d9277098a06f02c062f079214826498b7bad"
        ),
        .binaryTarget(
            name: "FirebaseCoreDiagnostics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseCoreDiagnostics.xcframework.zip",
            checksum: "4d0edcd0bcea5dfed683223b45bd131530027b5e3251007638ca226b3161ff84"
        ),
        .binaryTarget(
            name: "FirebaseCrashlytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseCrashlytics.xcframework.zip",
            checksum: "0597777a281e1abc184d93c9a766ffa79bc6d4b5efa26f2f9e1fb01d596e540f"
        ),
        .binaryTarget(
            name: "FirebaseDatabase",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseDatabase.xcframework.zip",
            checksum: "6a2d4e8008763609a90fc71908fa8985e8bf741b0f0ec74fcf16dc46d0c3b710"
        ),
        .binaryTarget(
            name: "FirebaseDynamicLinks",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseDynamicLinks.xcframework.zip",
            checksum: "b8d9987973d27418959c3f37caafbb71d05aa637c2cb84e8b18c2ac61c94659d"
        ),
        .binaryTarget(
            name: "FirebaseInstallations",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseInstallations.xcframework.zip",
            checksum: "47627c5179423b0d13d90d3cd7e4a022a9ca5a57765130fc1aad8e91519f5bca"
        ),
        .binaryTarget(
            name: "FirebasePerformance",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebasePerformance.xcframework.zip",
            checksum: "c90c9700825d98328fc4e718cc32296d1163add99666b3551c8137d64b528454"
        ),
        .binaryTarget(
            name: "FirebaseRemoteConfig",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/FirebaseRemoteConfig.xcframework.zip",
            checksum: "35601b769f0b20bdfc3daeb103df414dc8e455dd84734470378a23faf936d6c7"
        ),
        .binaryTarget(
            name: "GTMSessionFetcher",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/GTMSessionFetcher.xcframework.zip",
            checksum: "081c5b76de29fe415a39bddba04892d94d74cd3ed358ea8b975f021ca7269df0"
        ),
        .binaryTarget(
            name: "GoogleAppMeasurement",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/GoogleAppMeasurement.xcframework.zip",
            checksum: "6202f8d3a4239ed14c5330bead862cefb5d43994545b82aaee59ee90c7bebe0d"
        ),
        .binaryTarget(
            name: "GoogleAppMeasurementIdentitySupport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
            checksum: "e4f1195dcf8b8ca436c7b46b7bb9958c8b92f798e2e7b6365078e9132b5fc71b"
        ),
        .binaryTarget(
            name: "GoogleDataTransport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/GoogleDataTransport.xcframework.zip",
            checksum: "0ef7f4761318253926e1fc5703ac5102c4c532e71a2f3e2ab2fd1989ef3779b8"
        ),
        .binaryTarget(
            name: "GoogleUtilities",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/GoogleUtilities.xcframework.zip",
            checksum: "637d33ad4adffe095de7f09cfc66d9c7bbb0a006e0a8cf8c3968011fc072d878"
        ),
        .binaryTarget(
            name: "PromisesObjC",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/PromisesObjC.xcframework.zip",
            checksum: "57b50ee70fda6533801f5404f279f32d96369aed2b4adf506a2db3cdf11b048d"
        ),
        .binaryTarget(
            name: "leveldb-library",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/leveldb-library.xcframework.zip",
            checksum: "3a50acf8016d54572131f51675df7dc629554a51f7e9b40e5e8bc74e53a76b66"
        ),
        .binaryTarget(
            name: "nanopb",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/8.15.0/nanopb.xcframework.zip",
            checksum: "393f3e1a4c864d8968e4c0eff351daaa16dfa7d2973d39a22b0865a18aa14763"
        )
    ]
)
