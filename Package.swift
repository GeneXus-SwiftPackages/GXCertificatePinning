// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCertificatePinning",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0")],
	products: [
		.library(
			name: "GXCertificatePinning",
			targets: ["GXCertificatePinningWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.2.0-rc.3"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-rc.3"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "4.2.0-rc.3"),
		.package(url: "https://github.com/datatheorem/TrustKit", .upToNextMinor(from: "3.0.4"))
	],
	targets: [
		.target(name: "GXCertificatePinningWrapper",
				dependencies: [
					"GXCertificatePinning",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "TrustKitDynamic", package: "TrustKit", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCertificatePinning",
			url: "https://pkgs.genexus.dev/iOS/preview/GXCertificatePinning-4.2.0-rc.3.xcframework.zip",
			checksum: "5d92fd91a971938aff684225eef259efa13f00ce5950569f84a55a5bdd986eb4"
		)
	]
)