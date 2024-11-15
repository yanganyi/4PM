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
 
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                Text("")
                    .navigationTitle("Planner")
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Edit") {
                                print("")
                            }
                            
                            
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
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10)

                            
                        
                            NavigationLink(destination: MorningView()) {
                            Text(Image(systemName: "sunrise"))
                                    .foregroundStyle(.black)
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10)
                            
                            NavigationLink(destination: EveningView()) {
                            Text(Image(systemName: "sunset"))
                                    .foregroundStyle(.black)
                                                }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10)

                        
                        }.padding()
                    
                    
                }
                    .frame(height:100)
                
                List{
                    ForEach(todos, id: \.id) { task in
                         
                             Text("\(task.taskname)")
                        
                    }
                    
                    
                }
                
                NavigationLink(destination: AfternoonView()){
                                        
                                    }
                
            //}
        }
    }
}

#Preview {
    HomeView()
}

// Use Drag and Drop on list items
//
