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
                "_FBLPromises",
                "_FirebaseAnalytics",
                "_FirebaseAnalyticsSwift",
                "_FirebaseCore",
                "_FirebaseCoreInternal",
                "_FirebaseInstallations",
                "_GoogleAppMeasurement",
                "_GoogleAppMeasurementIdentitySupport",
                "_GoogleUtilities",
                "_nanopb"
            ],
            path: "Sources/FirebaseAnalytics"
        ),
        .target(
            name: "FirebaseAuthTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "_FirebaseAuth",
                "_GTMSessionFetcher"
            ],
            path: "Sources/FirebaseAuth"
        ),
        .target(
            name: "FirebaseCrashlyticsTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "_FirebaseCrashlytics",
                "_GoogleDataTransport"
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
                "_FirebaseDatabase",
                "_FirebaseDatabaseSwift",
                "_FirebaseSharedSwift",
                "_leveldb-library"
            ],
            path: "Sources/FirebaseDatabase"
        ),
        .target(
            name: "FirebaseDynamicLinksTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
            ],
            path: "Sources/FirebaseDynamicLinks"
        ),
        .target(
            name: "FirebaseInstallationsTarget",
            dependencies: [
                "_FirebaseCore",
                "_FBLPromises",
                "_GoogleUtilities"
            ],
            path: "Sources/FirebaseInstallations"
        ),
        .target(
            name: "FirebasePerformanceTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "_FirebaseABTesting",
                .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
                "_FirebaseRemoteConfig",
                "_GoogleDataTransport"
            ],
            path: "Sources/FirebasePerformance"
        ),
        .target(
            name: "FirebaseRemoteConfigTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "_FirebaseABTesting",
                "_FirebaseRemoteConfig",
                "_FirebaseRemoteConfigSwift",
                "_FirebaseSharedSwift"
            ],
            path: "Sources/FirebaseRemoteConfig"
        ),
        .binaryTarget(
            name: "_FBLPromises",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FBLPromises.xcframework.zip",
            checksum: "c6a44b903de138c3012b6c48efb00fe62b8f126bdae57ab0eceb8edb0ec23639"
        ),
        .binaryTarget(
            name: "_FirebaseABTesting",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseABTesting.xcframework.zip",
            checksum: "bfea62c32da53a6be8af86e1e8201005faca42e3835e70910655c71673d7131f"
        ),
        .binaryTarget(
            name: "_FirebaseAnalytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseAnalytics.xcframework.zip",
            checksum: "69d8d2668932ca3f69cb62b581c62b60daf88fd2de325533cf61f9f8556c039c"
        ),
        .binaryTarget(
          name: "_FirebaseAnalyticsSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseAnalyticsSwift.xcframework.zip",
          checksum: "e570f7b26cb61507ef2ee10bd045464623c25cc4e8fe2eb48d01f5fb9fcd5936"
        ),
        .binaryTarget(
            name: "_FirebaseAuth",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseAuth.xcframework.zip",
            checksum: "e8e58bc3b82030d82aecf135d7ec174a3b5fb4bd2136f6d9ff7af322256693e6"
        ),
        .binaryTarget(
            name: "_FirebaseCore",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseCore.xcframework.zip",
            checksum: "8000b3c51ba5fd34be7c0a6e115066659ac8a857265d6f1c8feecda1a8dec4e0"
        ),
        .binaryTarget(
          name: "_FirebaseCoreInternal",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseCoreInternal.xcframework.zip",
          checksum: "61843f4f5b0bd5ad5de3076795c858d5126fa970e3bbc9a42e46234cea2cf60f"
        ),
        .binaryTarget(
            name: "_FirebaseCrashlytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseCrashlytics.xcframework.zip",
            checksum: "f280e027f80ba142fbacbd932173d4a8c66b8830b426e3cb9f723ef6c2919bdb"
        ),
        .binaryTarget(
            name: "_FirebaseDatabase",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseDatabase.xcframework.zip",
            checksum: "00f3773c4ddc9076098f022b9fcd05e49fc487ca83aa1bbde991fa5c27b05973"
        ),
        .binaryTarget(
          name: "_FirebaseDatabaseSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseDatabaseSwift.xcframework.zip",
          checksum: "2311572ed3ca9c421d9e2a7323342952ff576c6d2d90b3a11d699723a6fb7be5"
        ),
        .binaryTarget(
            name: "_FirebaseDynamicLinks",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseDynamicLinks.xcframework.zip",
            checksum: "42e69021e3242137628767aeabe7f723fd3c6d87fafb25e2d1fa41946ffa31d2"
        ),
        .binaryTarget(
            name: "_FirebaseInstallations",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseInstallations.xcframework.zip",
            checksum: "043ae188f45e04bd67e3b290e5238650cb92f0f4c2fedda40e1706cc6b6971f2"
        ),
        .binaryTarget(
            name: "_FirebasePerformance",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebasePerformance.xcframework.zip",
            checksum: "d899672ce3c7ce8f164925dd2670eeec6edd407acfa81962e6356fddb8948ee7"
        ),
        .binaryTarget(
            name: "_FirebaseRemoteConfig",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseRemoteConfig.xcframework.zip",
            checksum: "6be1843c941f9ad8144ea49900a9e4216227892e8a4ff3a47dbaa02173514401"
        ),
        .binaryTarget(
          name: "_FirebaseRemoteConfigSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseRemoteConfigSwift.xcframework.zip",
          checksum: "693c120d3d9b5249e6e15d22fcaee1f656537e737baee80a008735a49bdfe1ad"
        ),
        .binaryTarget(
          name: "_FirebaseSharedSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_FirebaseSharedSwift.xcframework.zip",
          checksum: "870ecaf1a299130880346357d22eead2acdd0f35d559339f3a5f339ca81d9644"
        ),
        .binaryTarget(
            name: "_GTMSessionFetcher",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_GTMSessionFetcher.xcframework.zip",
            checksum: "8eb485b05c855f095e10085c243f1b22f97724a4b6da63cad88f9ea9573849c8"
        ),
        .binaryTarget(
            name: "_GoogleAppMeasurement",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_GoogleAppMeasurement.xcframework.zip",
            checksum: "b0eccb0bf736a16358a18b7061d1805b35f92e7158d8b9a6f54f11d9ae9b0e1e"
        ),
        .binaryTarget(
            name: "_GoogleAppMeasurementIdentitySupport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
            checksum: "f08f7329c1965143745ca7ba30cb51fe631ce2971fd09687c77f699905638a50"
        ),
        .binaryTarget(
            name: "_GoogleDataTransport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_GoogleDataTransport.xcframework.zip",
            checksum: "c7999042b775c38df7cc9a17eadc1af363e4ddd82208202e075cff3aa0753d4e"
        ),
        .binaryTarget(
            name: "_GoogleUtilities",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_GoogleUtilities.xcframework.zip",
            checksum: "d46218638bc947a49f929a84b318e091dea9770766fef5db0d672b4ad43c7624"
        ),
        .binaryTarget(
            name: "_leveldb-library",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_leveldb-library.xcframework.zip",
            checksum: "39e034cfd56ed3a27234c492c76b676500a89bf8b99cd65e499648aa0a3b4ea1"
        ),
        .binaryTarget(
            name: "_nanopb",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.16.0/_nanopb.xcframework.zip",
            checksum: "fcfff340d90a6f9f8411616ede906914d55a7d0db2a2384d506e6a15d1893675"
        )
    ]
)
