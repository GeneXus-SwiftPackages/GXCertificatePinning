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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.0.2"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.2"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "3.0.2"),
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXCertificatePinning-3.0.2.xcframework.zip",
			checksum: "c9c50cd02ae625837699bed2a98f72b37da5d72f80a11532cd479d86abd54dd0"
		)
	]
)