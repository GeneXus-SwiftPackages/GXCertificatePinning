// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCertificatePinning",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCertificatePinning",
			targets: ["GXCertificatePinningWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.1.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.1.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "2.1.0"),
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXCertificatePinning-2.1.0.xcframework.zip",
			checksum: "fcf36c6e7495f21ed83a8fdf03f79d092b7e388a20252050ccf0dd8c17f2470a"
		)
	]
)