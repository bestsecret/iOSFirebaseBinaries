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
                "FBLPromises",
                "FirebaseAnalytics",
                "FirebaseAnalyticsSwift",
                "FirebaseCore",
                "FirebaseCoreInternal",
                "FirebaseInstallations",
                "GoogleAppMeasurement",
                "GoogleAppMeasurementIdentitySupport",
                "GoogleUtilities",
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
                "FirebaseCrashlytics",
                "GoogleDataTransport"
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
                "FirebaseDatabaseSwift",
                "FirebaseSharedSwift",
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
                "FirebaseCore",
                "FBLPromises",
                "GoogleUtilities"
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
                "FirebaseRemoteConfig",
                "GoogleDataTransport"
            ],
            path: "Sources/FirebasePerformance"
        ),
        .target(
            name: "FirebaseRemoteConfigTarget",
            dependencies: [
                "Firebase",
                "FirebaseAnalyticsTarget",
                "FirebaseABTesting",
                "FirebaseRemoteConfig",
                "FirebaseRemoteConfigSwift",
                "FirebaseSharedSwift"
            ],
            path: "Sources/FirebaseRemoteConfig"
        ),
        .binaryTarget(
            name: "FBLPromises",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FBLPromises.xcframework.zip",
            checksum: "24e32d3dbb800f98d25bcd4fdf7d37e1f8d7742f36ecf2f375f6480d924b87ce"
        ),
        .binaryTarget(
            name: "FirebaseABTesting",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseABTesting.xcframework.zip",
            checksum: "8f22df5e8eb4e608aa24582d0f5d62951a533c6c64091cbc2dc7a8d7a59ad35d"
        ),
        .binaryTarget(
            name: "FirebaseAnalytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseAnalytics.xcframework.zip",
            checksum: "3fe3389ed5bf7f61d43a7b57dbce5af32f9e6ea340cf53b76eaf31f879347966"
        ),
        .binaryTarget(
          name: "FirebaseAnalyticsSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseAnalyticsSwift.xcframework.zip",
          checksum: "e6b440a89eb31fdb3f34b3b67dcbd87e3bae6d44b3bc2c8d79aadd3689e7bfdf"
        ),
        .binaryTarget(
            name: "FirebaseAuth",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseAuth.xcframework.zip",
            checksum: "ff1253d4382a98a06667f68f14a9cc5e1512172f2e5f09b49ebc71c7001c44d5"
        ),
        .binaryTarget(
            name: "FirebaseCore",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseCore.xcframework.zip",
            checksum: "ffc20569edee0d537de5778ea6c5646d120298b401cc926b5da1f03b1d07c9ba"
        ),
        .binaryTarget(
          name: "FirebaseCoreInternal",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseCoreInternal.xcframework.zip",
          checksum: "6acc4179c1822cf553e40f2613b14226c12cfddba7b0e25dd518744413349eec"
        ),
        .binaryTarget(
            name: "FirebaseCrashlytics",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseCrashlytics.xcframework.zip",
            checksum: "679a7cf5aef53a326969ebb103c1da826f9e930fc9769146c7140dc4a9770f6d"
        ),
        .binaryTarget(
            name: "FirebaseDatabase",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseDatabase.xcframework.zip",
            checksum: "46d9d7915b2054296b97f1b66b5db10c46ace789b4899278cda332ff006d9482"
        ),
        .binaryTarget(
          name: "FirebaseDatabaseSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseDatabaseSwift.xcframework.zip",
          checksum: "3783750dcb917df7542e5e0c7230406e80918fafdccb87a70b829e69aa0c638a"
        ),
        .binaryTarget(
            name: "FirebaseDynamicLinks",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseDynamicLinks.xcframework.zip",
            checksum: "dcf11847d8757f24dee033dd77a259af68e89bf100feaedff47b6a51980fdf01"
        ),
        .binaryTarget(
            name: "FirebaseInstallations",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseInstallations.xcframework.zip",
            checksum: "a35caa805d39d441ccea3c22305e65e0b26902ed8157b6a994641a4feb3a43bb"
        ),
        .binaryTarget(
            name: "FirebasePerformance",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebasePerformance.xcframework.zip",
            checksum: "aa9d4de13886e7d6268cde011e016f5c50422842a1f446ee151f62fdf5a0215c"
        ),
        .binaryTarget(
            name: "FirebaseRemoteConfig",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseRemoteConfig.xcframework.zip",
            checksum: "75b8fca29a8a3abbfcca3c5d49ac894bb93f0d24f8f6e3347d9206a87831bb7e"
        ),
        .binaryTarget(
          name: "FirebaseRemoteConfigSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseRemoteConfigSwift.xcframework.zip",
          checksum: "748452b54e510a26b8c37ac5bced511b3b1fbce060fc83e5754c33ac305e5c04"
        ),
        .binaryTarget(
          name: "FirebaseSharedSwift",
          url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/FirebaseSharedSwift.xcframework.zip",
          checksum: "553b397d767b6f0d5301e59d10a281056045e81587696f4beceb44aeec8c8f2d"
        ),
        .binaryTarget(
            name: "GTMSessionFetcher",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/GTMSessionFetcher.xcframework.zip",
            checksum: "8d57735db13a631e124a79d1343e52cdb5034e24fe3be72f8d40872f15eed95e"
        ),
        .binaryTarget(
            name: "GoogleAppMeasurement",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/GoogleAppMeasurement.xcframework.zip",
            checksum: "6fb897bce2c53cfe8d2b8964997993162e2c0a3f94549f4614f3cecf3d2f7a05"
        ),
        .binaryTarget(
            name: "GoogleAppMeasurementIdentitySupport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
            checksum: "b3f7a1fecf38884d73f4af2ee0f4e03efb3081d030d92cca6c6b8e456575a0b6"
        ),
        .binaryTarget(
            name: "GoogleDataTransport",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/GoogleDataTransport.xcframework.zip",
            checksum: "193ca557b5a15f3783f3bcaeede3af29a809d5226ebeddf7290717da008420e0"
        ),
        .binaryTarget(
            name: "GoogleUtilities",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/GoogleUtilities.xcframework.zip",
            checksum: "f9931c13b5f322a9bb9e2e4b584dc098f497de2037c2ebc8ae62ddf0301ac960"
        ),
        .binaryTarget(
            name: "leveldb-library",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/leveldb-library.xcframework.zip",
            checksum: "ba6af294598a76a295662929bcfe7e97b5e4680494c494705a9b9c04eddf5720"
        ),
        .binaryTarget(
            name: "nanopb",
            url: "https://github.com/bestsecret/iOSFirebaseBinaries/releases/download/10.5.0/nanopb.xcframework.zip",
            checksum: "b21654bbb61f63de60890011e1dec705bb7f07ef7aebacfa49bb48b6465a96e0"
        )
    ]
)
