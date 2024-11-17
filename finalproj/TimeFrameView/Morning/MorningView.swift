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
            List {
                
                ForEach(taskDataManager.tasks.filter({ $0.timeFrame == timeFrame }), id: \.id) { task in
                    VStack(alignment: .leading) {
                        Text(task.taskname)
                            .font(.headline)
                        Text("\(task.date.formatted(date: .abbreviated, time: .omitted))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.swipeActions {
                       
                        Button(role: .destructive) {
                            
                            if let index = taskDataManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskDataManager.tasks.remove(at: index)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                       
                        
                        
                        
                        Button() {
                            
                            if let index = taskDataManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskDataManager.tasks[index].timeFrame = .evening
                            }
                        } label: {
                            Label("Evening", systemImage: "sunset")
                                .foregroundColor(.black)

                                
                        }
                        .tint(.blue)
                        
                        
                        Button() {
                            
                            if let index = taskDataManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskDataManager.tasks[index].timeFrame = .afternoon
                            }
                        } label: {
                            Label("Afternoon", systemImage: "sun.max")
                                .foregroundColor(.black)
                        }
                        .tint(.orange)
                        
                        
                        
                        
                        Button() {
                            
                            if let index = taskDataManager.tasks.firstIndex(where: { $0.id == task.id }) {
                                taskDataManager.tasks[index].timeFrame = .morning
                            }
                        } label: {
                            Label("Morning", systemImage: "sunrise")
                                .foregroundColor(.black)

                        }
                        .tint(.yellow)
                        
                        
                    }
                }
                
                
            }
            .navigationTitle(timeFrame.title)
            
        }
    }
}
