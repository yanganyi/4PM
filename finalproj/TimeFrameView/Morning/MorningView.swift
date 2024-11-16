//
//  MorningView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct TaskView: View {
    
    let timeFrame: TimeFrame
    @Environment(TaskDataManager.self) private var taskDataManager
    
    var body: some View {
        NavigationStack {
            
            List(taskDataManager.tasks.filter({ $0.timeFrame == timeFrame })) { task in
                VStack(alignment: .leading) {
                    Text(task.taskname)
                        .font(.headline)
                    Text("\(task.date.formatted(date:.abbreviated, time: .omitted))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.navigationTitle(timeFrame.title)
        }
        
    }
}
