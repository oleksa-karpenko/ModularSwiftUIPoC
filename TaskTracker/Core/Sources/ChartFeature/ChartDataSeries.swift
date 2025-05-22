import SwiftUI

public struct ChartDataSeries: Identifiable {
  public let id = UUID()
  public let label: String
  public let count: Int
  public let color: Color

  public init(label: String, count: Int, color: Color) {
    self.label = label
    self.count = count
    self.color = color
  }
}
