//
//  AfternoonView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct AfternoonView: View {
    @State private var afternoons = [Afternoon(title: "test", date: " ")]
    var body: some View {
            NavigationStack {
                List($afternoons, editActions: [.all]) { $afternoon in
                    VStack(alignment: .leading) {
                        Text(afternoon.title)
                            .font(.headline)
                        if !afternoon.date.isEmpty {
                            Text(afternoon.date)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .navigationTitle("Afternoon")
            }
        }
    }

    
    #Preview {
        AfternoonView()
    }
