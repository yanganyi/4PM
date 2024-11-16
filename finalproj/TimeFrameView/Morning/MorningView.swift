//
//  MorningView.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct MorningView: View {
    @State private var mornings = [Morning]()
    var body: some View {
            NavigationStack {
                
                List($mornings, editActions: [.all]) { $morning in
                    VStack(alignment: .leading) {
                        Text(morning.taskname)
                            .font(.headline)
                        Text("\(morning.date.formatted(date:.abbreviated, time: .omitted))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                    }.navigationTitle("Morning")
                }
                
            }
        }
    

    
    #Preview {
        MorningView()
    }
