
import SwiftUI

@main
struct TodoistApp: App {
    @StateObject var taskListViewModel = TaskListViewModel()

    var body: some Scene {
        WindowGroup {
            TaskListView(taskListViewModel: taskListViewModel)
        }
    }
}
