
import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Task title", text: $task.title)
            }
            Section {
                Toggle(isOn: $task.isCompleted) {
                    Text("Completed")
                }
            }
        }
        .navigationBarTitle("Edit Task")
        .navigationBarItems(trailing:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Done")
        })
    }
}
