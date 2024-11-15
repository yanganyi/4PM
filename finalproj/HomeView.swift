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
    @State private var isExpanded = false
    @State private var isAllExpanded = false
    @State private var isLateExpanded = false
    
 
    
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
                
               

                    
                //ScrollView(.horizontal,showsIndicators: false){
                        
                        LazyHStack {
                            
                            NavigationLink(destination: MorningView()) {
                            Text(Image(systemName: "sun.max"))
                                    .foregroundStyle(.black)
                                    .font(.system(size: 49))
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                            
                            

                            
                        
                            NavigationLink(destination: MorningView()) {
                            Text(Image(systemName: "sunrise"))
                                    .foregroundStyle(.black)
                                    .font(.system(size: 45))
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.orange)
                            .cornerRadius(10)
                            
                            
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
                
                Section(isExpanded: $isLateExpanded) {
                } header: {
                    Text("Late Tasks")
                }
                
                Section(isExpanded: $isExpanded) {
                } header: {
                    Text("Current Tasks")
                }
                
                Section(isExpanded: $isAllExpanded) {
                    
                    
                    ForEach(todos, id: \.id) { task in
                             
                                
                        VStack(alignment: .leading) {
                            Text("\(task.taskname)")
                                            .font(.headline)
                            Text("\(task.date)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                            
                        }.onDelete { indexSet in
                            todos.remove(atOffsets: indexSet)
                            }
                } header: {
                   Text("Completed tasks")
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
