import SwiftUI

struct ItemView: View {
    
    var handleAdd: (ItemModel) -> Void = {_ in }

    @State private var newItemText = ""
    @State private var selectedDate = Date()
    @State private var showAlert = false

//    The presentationMode environment variable is accessed using the @Environment(\.presentationMode) property wrapper. This variable allows the view to control its presentation, such as dismissing itself or presenting a child view.
//
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("New Item", text: $newItemText)
                    DatePicker("Due Date", selection: $selectedDate)
                }
                Section {
                    Button("Add Item") {
                        if newItemText.isEmpty {
                            showAlert = true
                        } else {
                            
                            let item = ItemModel(id: UUID(), dueDate: selectedDate, description: newItemText)
                            handleAdd(item)
                            
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add TODO")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please enter a new item"),
                    dismissButton: .default(Text("OK"))
                )
            }

        }
    }
}
