
import SwiftUI

struct TaskRowView: View {
    @ObservedObject var taskRowViewModel: TaskRowViewModel
    var isEditing: Bool
    var isSelected: Bool
    @State private var updatedTitle: String = ""

    var body: some View {
        HStack {
            Button(action: {
                taskRowViewModel.toggleTaskCompletion()
            }) {
                Image(systemName: taskRowViewModel.task.isCompleted ? "checkmark.circle.fill" : "circle")
            }

            if isEditing {
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }

                TextField("Edit task", text: $updatedTitle, onCommit: {
                    taskRowViewModel.editTask(newTitle: updatedTitle)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 8)

                Button(action: {
                    taskRowViewModel.deleteTask()
                }) {
                    Image(systemName: "trash.circle")
                        .foregroundColor(.red)
                }
            } else {
                Text(taskRowViewModel.task.title)
                    .strikethrough(taskRowViewModel.task.isCompleted)
                    .foregroundColor(taskRowViewModel.task.isCompleted ? .gray : .primary)
            }
        }
    }
}
