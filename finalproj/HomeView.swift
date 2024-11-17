//
//  HomeView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false
    @State private var isExpanded = true
    @State private var isAllExpanded = true
    @State private var isLateExpanded = true
    @State private var taskManager = TaskDataManager()
    
    var currentTimeFrame: TimeFrame? {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH"
        let hoursInString = timeFormatter.string(from: Date())
        if let hours = Int(hoursInString) {
            if hours < 12 {
                return .morning
            } else if hours < 17 {
                return .afternoon
            } else {
                return .evening
            }
        } else {
            return nil
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                Text("")
                    .navigationTitle("Planner")
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Add Task",systemImage: "plus"){
                                showingSheet.toggle()
                                
                                
                                
                            }.sheet(isPresented: $showingSheet) {
                                AddView()
                                    .presentationDetents(.init([.medium]))
                                    .presentationDragIndicator(.visible)
                            }
                        }
                    }
                
                
                
                
                LazyHStack {
                    ZStack{
                        NavigationLink(destination: TaskView(timeFrame: .morning)) {
                            VStack{
                                Text(Image(systemName: "sunrise"))
                                    .foregroundStyle(.black)
                                    .font(.system(size: 45))
                                
                                Text("\(taskManager.tasks.filter { $0.timeFrame == .morning }.count)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 4)
                                
                            }
                            //.listRowBackground(Color.clear)
                        }
                        .padding()
                        .frame(width: 110, height: 100, alignment: .center)
                        .background(.yellow)
                        .cornerRadius(10)
                    }
                    .dropDestination(for: TaskData.self) { items, destination in
                        
                        for item in items {
                            if let index = taskManager.tasks.firstIndex(where: { $0.id == item.id }) {
                                taskManager.tasks[index].timeFrame = .morning
                                
                            }
                        }
                        
                        return true
                        
                    }
                    
                    
                    
                    
                    ZStack{
                        NavigationLink(destination: TaskView(timeFrame: .afternoon)) {
                            
                            VStack{
                                Text(Image(systemName: "sun.max"))
                                    .foregroundStyle(.black)
                                    .font(.system(size: 45))
                                
                                Text("\(taskManager.tasks.filter { $0.timeFrame == .afternoon }.count)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 4)
                            }
                        }
                        //.listRowBackground(Color.clear)
                        .padding()
                        .frame(width: 110, height: 100, alignment: .center)
                        .background(.orange)
                        .cornerRadius(10)
                        
                    }.dropDestination(for: TaskData.self) { items, destination in
                        
                        
                        for item in items {
                            if let index = taskManager.tasks.firstIndex(where: { $0.id == item.id }) {
                                taskManager.tasks[index].timeFrame = .afternoon
                            }
                        }
                        
                        return true
                        
                    }
                    
                    ZStack{
                        NavigationLink(destination: TaskView(timeFrame: .evening)) {
                            
                            VStack{
                                
                                
                                Text(Image(systemName: "sunset"))
                                    .foregroundStyle(.black)
                                
                                Text("\(taskManager.tasks.filter { $0.timeFrame == .evening }.count)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 4)
                            }
                            
                        }
                        
                        .padding()
                        .frame(width: 110, height: 100, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.system(size: 45))
                        
                    }.dropDestination(for: TaskData.self) { items, destination in
                        
                        
                        for item in items {
                            if let index = taskManager.tasks.firstIndex(where: { $0.id == item.id }) {
                                taskManager.tasks[index].timeFrame = .evening
                            }
                        }
                        
                        return true
                        
                    }
                    
                    
                }.padding()
                
                
                
            }
            .frame(height:160)
            
            
            List{
                
                Section(isExpanded: $isExpanded) {
                    if let currentTimeFrame{
                        ForEach(taskManager.tasks.filter({ $0.timeFrame == currentTimeFrame }), id: \.id) { task in
                            
                            
                            VStack(alignment: .leading) {
                                Text("\(task.taskname)")
                                    .font(.headline)
                                
                                
                                Text("\(task.date.formatted(date:.abbreviated, time: .shortened))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                
                            }
                            .draggable(task)
                            
                            
                        }.onDelete { indexSet in
                            taskManager.tasks.remove(atOffsets: indexSet)
                        }
                    }
                } header: {
                    
                    Text("Current Tasks")
                        .bold()
                }
                
                Section(isExpanded: $isLateExpanded) {
                    ForEach(taskManager.tasks.filter({ $0.date < Date()}), id: \.id) { task in
                        
                        
                        VStack(alignment: .leading) {
                            Text("\(task.taskname)")
                                .font(.headline)
                            
                            
                            Text("\(task.date.formatted(date:.abbreviated, time: .shortened))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            
                        }
                        .draggable(task)
                        
                        
                    }.onDelete { indexSet in
                        taskManager.tasks.remove(atOffsets: indexSet)
                    }
                } header: {
                    Text("Late Tasks")
                        .bold()
                }
                
                Section(isExpanded: $isAllExpanded) {
                    
                    
                    ForEach(taskManager.tasks, id: \.id) { task in
                        
                        
                        VStack(alignment: .leading) {
                            Text("\(task.taskname)")
                                .font(.headline)
                            
                            
                            Text("\(task.date.formatted(date:.abbreviated, time: .shortened))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            
                        }
                        .draggable(task)
                        
                        
                    }.onDelete { indexSet in
                        taskManager.tasks.remove(atOffsets: indexSet)
                    }
                } header: {
                    Text("All tasks")
                        .bold()
                }
                
                
                
                
                
            }
            .listStyle(.sidebar)
            
            
            
            
            //}
            
        }
        .environment(taskManager)
        
        
    }
}

#Preview {
    HomeView()
}

