//
//  MorningView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct MorningView: View {
    @State private var mornings = [Morning(id: 1, title: "Add your morning tasks here", date: "11/11/24"),
                                  Morning(id: 2, title: "Slide left to delete or change time frames", date: "11/11/24")]
    var body: some View {
        NavigationView {
            List(mornings, id:\.id) { Morning in
                Text(Morning.title)
            }
            VStack{
                Text("Hi")
            }
        }.navigationTitle("Morning")
    }
}
#Preview {
    MorningView()
}
