import Charts
import SwiftUI

public struct TaskPieChartView: View {
  public let data: [ChartDataSeries]

  public init(data: [ChartDataSeries]) {
    self.data = data
  }

  public var body: some View {
    VStack(alignment: .leading) {
      Text("Progress")
        .font(.headline)
        .padding(.bottom, 4)

      Chart {
        ForEach(data) { stat in
          SectorMark(
            angle: .value("Count", stat.count),
            innerRadius: .ratio(0.6),
            angularInset: 1,
          )
          .foregroundStyle(stat.color)
          .annotation(position: .overlay) {
            Text("\(stat.count)")
              .font(.caption)
              .foregroundColor(.primary)
          }
        }
      }
      .frame(height: 160)
    }
    .padding()
    .background(.white)
    .cornerRadius(16)
    .shadow(radius: 4)
  }
}
