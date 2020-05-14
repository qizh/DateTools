// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "DateToolsSwift",
	products: [
		.library(name: "DateToolsSwift", 			targets: ["DateToolsSwift"]),
		.library(name: "DateToolsSwiftDynamic", type: .dynamic, targets: ["DateToolsSwift"]),
		.library(name: "DateToolsSwiftStatic", 	type: .static, 	targets: ["DateToolsSwift"]),
	],
	dependencies: [],
	targets:[
		.target(
			name: "DateToolsSwift", 
			path: "Sources/DateToolsSwift", 
			exclude: ["Examples"]
		),
		.testTarget(
			name: "DateToolsSwiftTests", 
			dependencies: ["DateToolsSwift"]
		)
	]
)
