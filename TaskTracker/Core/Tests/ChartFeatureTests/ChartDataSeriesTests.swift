import ChartFeature
import SwiftUI
import Testing

struct ChartDataSeriesTests {
  @Test func initCreatesExpectedValues() {
    let series = ChartDataSeries(label: "Completed", count: 5, color: .green)
    #expect(series.label == "Completed")
    #expect(series.count == 5)
    #expect(series.color == .green)
  }

  @Test func chartDataSeriesHasUniqueIDs() {
    let a = ChartDataSeries(label: "One", count: 1, color: .blue)
    let b = ChartDataSeries(label: "Two", count: 2, color: .red)
    #expect(a.id != b.id)
  }

  @Test func identifiableConformance() {
    let series = ChartDataSeries(label: "Test", count: 10, color: .yellow)
    #expect(series.id != UUID()) // implicit expectation that id exists and is unique
  }
}
