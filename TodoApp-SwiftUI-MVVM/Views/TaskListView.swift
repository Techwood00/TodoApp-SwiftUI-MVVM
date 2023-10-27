import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListViewModel: TaskListViewModel
    @State private var newTaskTitle = ""
    @State private var isEditing = false
    @State private var selectedTask: Task?

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Task")) {
                    HStack {
                        TextField("Task title", text: $newTaskTitle)
                        Button(action: addTask) {
                            Text("Add")
                        }
                    }
                }
                Section(header: Text("Tasks")) {
                    ForEach(taskListViewModel.tasks) { task in
                        TaskRowView(taskRowViewModel: TaskRowViewModel(task: task, taskListViewModel: taskListViewModel), isEditing: isEditing, isSelected: task.id == selectedTask?.id)
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Todoist")
        }
    }

    private func addTask() {
        if !newTaskTitle.isEmpty {
            taskListViewModel.addTask(title: newTaskTitle)
            newTaskTitle = ""
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            taskListViewModel.deleteTask(task: taskListViewModel.tasks[index])
        }
    }
}
