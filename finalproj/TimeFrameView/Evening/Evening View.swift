//
//  Evening View.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//
import SwiftUI

struct EveningView: View {
    @State var evening: [TaskData]
    var body: some View {
        NavigationStack {
            List($evening, editActions: [.all]) { $evening in
                VStack(alignment: .leading) {
                    Text(evening.taskname)
                        .font(.headline)
                    Text("\(evening.date.formatted(date:.abbreviated, time: .omitted))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Evening")
        }
    }
}
