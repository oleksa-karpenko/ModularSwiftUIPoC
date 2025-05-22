import SnapshotTesting
import SwiftUI
@testable import TaskTracker
import Testing

import SnapshotTesting

@MainActor
@Suite
struct SideMenuSnapshotSuite {
  @Test("Default snapshot of SideMenu")
  func sideMenuSnapshot() {
    let view = SideMenu.defaultMenu { _ in }
    let vc = UIHostingController(rootView: view)
    vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 700)
    assertSnapshot(of: vc, as: .image, record: false)
  }
}
