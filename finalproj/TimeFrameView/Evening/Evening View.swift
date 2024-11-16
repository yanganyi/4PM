//
//  Evening View.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//
import SwiftUI

struct EveningView: View {
    @State private var evenings = [Evening]()
    var body: some View {
            NavigationStack {
                List($evenings, editActions: [.all]) { $evening in
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

    
    #Preview {
        EveningView()
    }
