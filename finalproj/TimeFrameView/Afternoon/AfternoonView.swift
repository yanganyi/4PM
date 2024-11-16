//
//  AfternoonView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct AfternoonView: View {
    @State private var afternoons = [Afternoon]()
    var body: some View {
            NavigationStack {
                List($afternoons, editActions: [.all]) { $afternoon in
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

    
    #Preview {
        AfternoonView()
    }
