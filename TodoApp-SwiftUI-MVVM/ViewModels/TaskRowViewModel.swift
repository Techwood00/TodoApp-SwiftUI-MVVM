
import SwiftUI

class TaskRowViewModel: ObservableObject {
    @Published var task: Task
    var taskListViewModel: TaskListViewModel

    init(task: Task, taskListViewModel: TaskListViewModel) {
        self.task = task
        self.taskListViewModel = taskListViewModel
    }

    func toggleTaskCompletion() {
        taskListViewModel.toggleTaskCompletion(task: task)
    }

    func editTask(newTitle: String) {
        taskListViewModel.editTask(task: task, newTitle: newTitle)
    }

    func deleteTask() {
        taskListViewModel.deleteTask(task: task)
    }
}
