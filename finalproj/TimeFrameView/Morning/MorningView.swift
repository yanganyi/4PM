//
//  MorningView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct MorningView: View {
    @State private var mornings = [Morning(title: "Add your morning tasks here", date: "11/11/24"),
                                  Morning(title: "Slide left to delete or change time frames", date: "11/11/24")]
    var body: some View {
        NavigationStack {
            List(mornings) { Morning in
                Text(Morning.title)
            }
            .navigationTitle("Morning")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("") {
                        print("")
                    }
                    
                    
                }
            }
        }
    }
}
#Preview {
    MorningView()
}
