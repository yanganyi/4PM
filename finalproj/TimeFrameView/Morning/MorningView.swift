//
//  MorningView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct MorningView: View {
    @State private var mornings = [Morning(title: "test", date: " ")]
    var body: some View {
            NavigationStack {
                List($mornings, editActions: [.all]) { $morning in
                    VStack(alignment: .leading) {
                        Text(morning.title)
                            .font(.headline)
                        if !morning.date.isEmpty {
                            Text(morning.date)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .navigationTitle("Morning")
            }
        }
    }

    
    #Preview {
        MorningView()
    }
