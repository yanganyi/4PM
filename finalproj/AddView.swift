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
    
    @Environment(TaskDataManager.self) private var taskDataManager
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    TextField("Task name", text: $taskname)
                    
                    DatePicker(
                        "Date",
                        selection: $date
                    )
                    
                    
                    Button(action: {
                        let todo = TaskData(taskname: taskname, date: date, timeFrame: .none)
                        taskDataManager.tasks.append(todo)
                        
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
