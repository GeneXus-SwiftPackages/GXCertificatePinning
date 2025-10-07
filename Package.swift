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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.0.0-beta.47"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.0-beta.47"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "4.0.0-beta.47"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCertificatePinning-4.0.0-beta.47.xcframework.zip",
			checksum: "a2b70542c7812d0e8305a81248836061a60ebc5a1098d15e0e975bb3e834edf8"
		)
	]
)