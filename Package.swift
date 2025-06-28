// swift-tools-version:6.1
import PackageDescription

let package = Package(
	name: "DrumKitDatabase",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "DrumKitDatabase",
			targets: ["DrumKitDatabase"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/DrumKitService", branch: "main")
	],
	targets: [
		.target(
			name: "DrumKitDatabase",
			dependencies: ["DrumKitService"]
		)
	],
	swiftLanguageModes: [.v6]
)
	
for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency"),
		.enableUpcomingFeature("ExistentialAny")
	]
}
