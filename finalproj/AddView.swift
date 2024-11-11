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
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2050, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()

    var body: some View {
        NavigationView {
            VStack{
                List{
                    TextField("Task name", text: $taskname)
                        
                    DatePicker(
                            "Date",
                             selection: $date,
                             in: dateRange,
                             displayedComponents: [.date, .hourAndMinute]
                        )

                    
                    Button(action: {
                        print("Task name: \(taskname)")
                        
                    }) {
                        Text("Save")
                    }.navigationTitle("Add task")
                    
                        
                    
                    }
                
                    
                
                }
            }
        }
}

#Preview {
    AddView()
}
