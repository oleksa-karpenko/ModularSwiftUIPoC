import Foundation
import SwiftUI

public final class TaskListViewModel: ObservableObject {
  @Published public var tasks: [Task]

  public init(tasks: [Task] = []) {
    self.tasks = tasks
  }

  public func toggleCompletion(of task: Task) {
    if let index = tasks.firstIndex(of: task) {
      tasks[index].isCompleted.toggle()
    }
  }

  public static var preview: TaskListViewModel {
    TaskListViewModel(tasks: [
      Task(
        title: "Buy groceries",
        details: "Milk, eggs, bread, and vegetables",
        isCompleted: true,
      ),
      Task(
        title: "Finish snapshot tests",
        details: "Ensure all views render correctly and are regression-tested",
        isCompleted: true,
      ),
      Task(
        title: "Write documentation",
        details: "Document architecture, modules, and usage instructions",
      ),
    ])
  }
}
