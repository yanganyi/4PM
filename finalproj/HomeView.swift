//
//  HomeView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false
    @State private var todos = [TaskData]()
    @State private var mourning = [Morning]()
    @State private var afternoon = [Afternoon]()
    @State private var evening = [Evening]()
    @State private var isExpanded = true
    @State private var isAllExpanded = true
    @State private var isLateExpanded = true
    
 
    
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
                                AddView(sourceArray: $todos)
                                    .presentationDetents(.init([.medium]))
                                    .presentationDragIndicator(.visible)
                            }
                        }
                    }
                
               

                        
                        LazyHStack {
                            
                            NavigationLink(destination: MorningView()) {
                            Text(Image(systemName: "sunrise"))
                                    .foregroundStyle(.black)
                                    .font(.system(size: 45))
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                            
                            

                            
                            ZStack{
                                NavigationLink(destination: MorningView()) {
                                    Text(Image(systemName: "sun.max"))
                                        .foregroundStyle(.black)
                                        .font(.system(size: 49))
                                        
                                    
                                }
                                //.listRowBackground(Color.clear)
                                .padding()
                                .background(.orange)
                                .cornerRadius(10)
                                
                            }.dropDestination(for: Afternoon.self) { items, destination in
                                
                                
                                afternoon.append(contentsOf: items)
                                
                                return true
                                
                            }
                            
                            
                            NavigationLink(destination: EveningView()) {
                            Text(Image(systemName: "sunset"))
                                    .foregroundStyle(.black)
                                                }
                            
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                            .font(.system(size: 45))

                        
                        }.padding()
                
                    
                    
                }
                    .frame(height:160)
                    
                
            List{
                
                Section(isExpanded: $isExpanded) {
                } header: {
                    
                    Text("Current Tasks")
                        .bold()
                }
                    
                Section(isExpanded: $isLateExpanded) {
                } header: {
                    Text("Late Tasks")
                        .bold()
                }
                
                Section(isExpanded: $isAllExpanded) {
                    
                    
                    ForEach(todos, id: \.id) { task in
                             
                                
                        VStack(alignment: .leading) {
                            Text("\(task.taskname)")
                                            .font(.headline)
                            
                                            
                            Text("\(task.date.formatted(date:.abbreviated, time: .omitted))")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                          
                                            
                        }
                            .draggable(task)
                        
                            
                        }.onDelete { indexSet in
                            todos.remove(atOffsets: indexSet)
                            }
                } header: {
                   Text("All tasks")
                        .bold()
                }
                
                
                
                    
                    
            }
            .listStyle(.sidebar)
            
                
                
                
            //}
            
        }
        
        
        
    }
}

#Preview {
    HomeView()
}

// Use Drag and Drop on list items
//
