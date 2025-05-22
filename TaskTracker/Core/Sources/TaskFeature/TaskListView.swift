import DesignSystem
import SwiftUI

public struct TaskListView: View {
  @ObservedObject var viewModel: TaskListViewModel

  public init(viewModel: TaskListViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    List {
      ForEach(viewModel.tasks) { task in
        HStack {
          Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            .onTapGesture {
              viewModel.toggleCompletion(of: task)
            }
          VStack(alignment: .leading) {
            Text(task.title)
              .strikethrough(task.isCompleted)
              .font(Theme.font(for: .title))

            Text(task.details)
              .strikethrough(task.isCompleted)
              .font(Theme.font(for: .body))
          }
        }
      }
    }
  }
}

#Preview {
  TaskListView(viewModel: TaskListViewModel.preview)
}
