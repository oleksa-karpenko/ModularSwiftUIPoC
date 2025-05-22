import SwiftUI
import TaskFeature
import Testing

@Suite
struct TaskListViewModelTests {
  @Test("Initializes with empty task list")
  func initEmpty() {
    let viewModel = TaskListViewModel()
    #expect(viewModel.tasks.isEmpty)
  }

  @Test("Initializes with provided tasks")
  func initWithTasks() {
    let tasks = [
      Task(title: "A", details: "Details A"),
      Task(title: "B", details: "Details B"),
    ]
    let viewModel = TaskListViewModel(tasks: tasks)
    #expect(viewModel.tasks.count == 2)
    #expect(viewModel.tasks[0].title == "A")
  }

  @Test("Toggles task completion correctly")
  func testToggleCompletion() {
    let task = Task(title: "A", details: "D", isCompleted: false)
    let viewModel = TaskListViewModel(tasks: [task])

    viewModel.toggleCompletion(of: task)
    #expect(viewModel.tasks[0].isCompleted == true)

    viewModel.toggleCompletion(of: viewModel.tasks[0])
    #expect(viewModel.tasks[0].isCompleted == false)
  }

  @Test("Preview provides expected number of tasks")
  func previewHasTasks() {
    let preview = TaskListViewModel.preview
    #expect(preview.tasks.count == 3)
    #expect(preview.tasks[0].title == "Buy groceries")
  }

  @Test("Toggle has no effect for non-existing task")
  func toggleUnknownTask() {
    let knownTask = Task(title: "Known", details: "")
    let unknownTask = Task(title: "Unknown", details: "")

    let viewModel = TaskListViewModel(tasks: [knownTask])
    viewModel.toggleCompletion(of: unknownTask)

    // Should remain unchanged
    #expect(viewModel.tasks[0].isCompleted == false)
  }
}
