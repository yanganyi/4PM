//
//  AfternoonView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct AfternoonView: View {
    @State var afternoon: [TaskData]
    var body: some View {
        NavigationStack {
            List($afternoon, editActions: [.all]) { $afternoon in
                VStack(alignment: .leading) {
                    Text(afternoon.taskname)
                        .font(.headline)
                    Text("\(afternoon.date.formatted(date:.abbreviated, time: .omitted))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Afternoon")
        }
    }
}
