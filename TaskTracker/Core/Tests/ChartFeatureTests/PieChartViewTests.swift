import SwiftUI
import Testing

import SnapshotTesting

@testable import ChartFeature

struct PieChartViewTests {
  let inRecordMode = false

  @MainActor
  @Test
  func pieChartWithTwoSegments() async throws {
    let data = [
      ChartDataSeries(label: "Done", count: 3, color: .green),
      ChartDataSeries(label: "Pending", count: 2, color: .gray),
    ]

    let controller = UIHostingController(rootView: TaskPieChartView(data: data))
    controller.view.frame = CGRect(x: 0, y: 0, width: 300, height: 500)

    assertSnapshot(of: controller, as: .image, record: inRecordMode)
  }
}
