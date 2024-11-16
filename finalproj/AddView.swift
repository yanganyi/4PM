//
//  AddView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct AddView: View {
    @State private var taskname: String = ""
    @State private var date = Date()
    @Environment(\.dismiss) var dismiss
    @Binding var sourceArray: [TaskData]

    var body: some View {
        NavigationView {
            VStack{
                List{
                    Section {
                        TextField("Task name", text: $taskname)
                        
                        DatePicker(
                            "Date",
                            selection: $date
                        )
                        
                    }

                    Section {
                        Button(action: {
                            let todo = TaskData(taskname: taskname, date: date)
                            sourceArray.append(todo)
                            
                            dismiss()
                            
                        }) {
                            Text("Save")
                        }.navigationTitle("Add task")
                        
                        
                        Button("Cancel", role: .destructive) {
                            dismiss()
                        }
                    }
                    
                        
                    
                    }
                
                    
                
                }
            }
        }
}

#Preview {
@Previewable @State var todos: [TaskData] = []
AddView(sourceArray: $todos)
}
