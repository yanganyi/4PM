

//
//  HomeView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false
    
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
                                AddView()
                                    .presentationDetents(.init([.medium]))
                                    .presentationDragIndicator(.visible)
                            }
                        }
                    }
                
               

                    
                ScrollView(.horizontal){
                        
                        LazyHStack {
                            
                        Text(Image(systemName: "sun.max"))
                            .overlay {
                                NavigationLink(destination: MorningView()) {
                                    
                                }
                                    .opacity(0)
                                    
                            }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                        
                        Text(Image(systemName: "sunrise"))
                            .overlay {
                                NavigationLink(destination: AfternoonView()) {
                                    
                                }
                                    .opacity(0)
                                
                            }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                        
                        Text(Image(systemName: "sunset"))
                            .overlay {
                                NavigationLink(destination: EveningView()) {
                                    
                                }
                                    .opacity(0)
                                
                            }
                            //.listRowBackground(Color.clear)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                        
                        }.padding()
                    
                    
                }.background(Color(UIColor.systemGroupedBackground))
                
            }
        }
    }
}

#Preview {
    HomeView()
}


// Use Drag and Drop on list items
//
