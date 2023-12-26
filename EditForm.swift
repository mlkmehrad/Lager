
//
//  EditForm.swift
//  Lager
//
//  Created by Mohammad Javad Malekan on 26.12.23.
//

import SwiftUI

struct EditForm: View {
    @Binding var item: Item?
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Form {
            Section(header: Text("Edit Item")) {
                TextField("New Timestamp", text: Binding(
                    get: {
                        item?.timestamp ?? ""
                    },
                    set: { newValue in
                        item?.timestamp = newValue
                    }
                ))
            }

            Section {
                Button("Save Changes") {
                    saveChanges()
                }
                .disabled(item == nil)
            }
        }
        .navigationTitle("Edit Item")
    }

    private func saveChanges() {
        withAnimation {
            do {
                try modelContext.save()
            } catch {
                // Handle the error
                print("Error saving changes: \(error)")
            }
        }
    }
}

struct EditForm_Previews: PreviewProvider {
    static var previews: some View {
        EditForm(item: .constant(Item()))
    }
}



