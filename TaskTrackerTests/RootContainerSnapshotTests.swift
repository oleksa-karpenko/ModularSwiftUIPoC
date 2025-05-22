import SnapshotTesting
import SwiftUI
@testable import TaskTracker
import XCTest

final class RootContainerSnapshotTests: XCTestCase {
  let makeSnapshot = false

  func testRootContainer() {
    let view = RootContainer()
    let vc = UIHostingController(rootView: view)
    vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
    assertSnapshot(of: vc, as: .image, record: makeSnapshot)
  }

  func testRootContainerWithSideMenu() {
    let view = RootContainer(isMenuOpen: true)
    let vc = UIHostingController(rootView: view)
    vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
    assertSnapshot(of: vc, as: .image, record: makeSnapshot)
  }
}
