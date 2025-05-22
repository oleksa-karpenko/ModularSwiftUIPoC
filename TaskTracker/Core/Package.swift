import Foundation

// swift-tools-version:6.1
import PackageDescription

let defaultSwiftSettings: [SwiftSetting] = []

let package = Package(
  name: "Core",
  platforms: [.iOS(.v17)],
  products: [
    .library(name: "DesignSystem", targets: ["DesignSystem"]),
    .library(name: "TaskFeature", targets: ["TaskFeature"]),
    .library(name: "ChartFeature", targets: ["ChartFeature"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.12.0"),
  ],
  targets: [
    // -----------------------------------------------------------------
    .target(name: "DesignSystem", dependencies: []),
    .testTarget(
      name: "DesignSystemTests",
      dependencies: ["DesignSystem"],
    ),
    // -----------------------------------------------------------------
    .target(name: "ChartFeature", dependencies: []),
    .test(
      name: "ChartFeatureTests",
      dependencies: [
        "ChartFeature",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
    ),
    // -----------------------------------------------------------------
    .target(name: "TaskFeature", dependencies: ["DesignSystem"]),
    .test(
      name: "TaskFeatureTests",
      dependencies: [
        "TaskFeature",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
    ),
  ],
)

extension Target {
  static func test(
    name: String,
    dependencies: [Target.Dependency] = [],
    exclude: [String] = [],
    resources: [Resource]? = nil,
    swiftSettings: [SwiftSetting]? = defaultSwiftSettings,
  ) -> Target {
    .testTarget(
      name: name,
      dependencies: dependencies,
      exclude: folders(relativeTo: "Tests/\(name)", named: "__Snapshots__") + exclude,
      resources: resources,
      swiftSettings: swiftSettings,
    )
  }
}

func folders(relativeTo parent: String, named folderName: String) -> [String] {
  let url = URL(string: #file)!.deletingLastPathComponent().appendingPathComponent(parent)
  let options: FileManager.DirectoryEnumerationOptions = [.skipsHiddenFiles, .skipsPackageDescendants, .producesRelativePathURLs]
  let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil, options: options)!
  let paths = enumerator
    .compactMap { $0 as? URL }
    .filter { $0.lastPathComponent == folderName }
    .map(\.relativePath)

  return Array(Set(paths))
}
