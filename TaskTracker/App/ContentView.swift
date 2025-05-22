//
//  ContentView.swift
//  TaskTracker
//
//  Created by Oleksandr Karpenko on 20.05.2025.
//

import ChartFeature
import SwiftUI
import TaskFeature

struct ContentView: View {
  @StateObject private var viewModel = TaskListViewModel.preview

  var body: some View {
    NavigationView {
      VStack(spacing: 16) {
        Spacer(minLength: 12)
        TaskPieChartView(data: pieChartData)
          .padding(.horizontal)

        TaskListView(viewModel: viewModel)
      }
      .navigationTitle("Tasks")
    }
  }

  private var pieChartData: [ChartDataSeries] {
    let done = viewModel.tasks.filter(\..isCompleted).count
    let todo = viewModel.tasks.count - done
    return [
      ChartDataSeries(label: "Done", count: done, color: .green),
      ChartDataSeries(label: "To Do", count: todo, color: .gray),
    ]
  }
}

#Preview {
  ContentView()
}
