//
//  Evening View.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//
import SwiftUI

struct EveningView: View {
    @State private var evenings = [Evening(title: "test", date: " ")]
    var body: some View {
            NavigationStack {
                List($evenings, editActions: [.all]) { $evening in
                    VStack(alignment: .leading) {
                        Text(evening.title)
                            .font(.headline)
                        if !evening.date.isEmpty {
                            Text(evening.date)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .navigationTitle("Evening")
            }
        }
    }

    
    #Preview {
        EveningView()
    }
