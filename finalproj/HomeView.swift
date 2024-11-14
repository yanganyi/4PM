////
////  HomeView.swift
////  finalproj
////
////  Created by Qi Yang on 11/11/24.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    
//    @State private var showingSheet = false
//    
//    var body: some View {
//        NavigationStack {
//            Text("Hello, World!")
//                .navigationTitle("Planner")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button("Edit") {
//                            print("")
//                        }
//                        
//                        
//                    }
//                    
//                    
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button("Add Task",systemImage: "plus"){
//                            showingSheet.toggle()
//                            
//                            
//                            
//                        }.sheet(isPresented: $showingSheet) {
//                            AddView()
//                                .presentationDetents(.init([.medium]))
//                                .presentationDragIndicator(.visible)
//                        }
//                    }
//                }
//            
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}

import SwiftUI

struct HomeView: View {    
    var body: some View {
        VStack {
            Text("Welcome to Home View!")
                .font(.largeTitle)
                .padding()
            
        }
    }
}

#Preview {
    HomeView()
}
