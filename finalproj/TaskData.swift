//
//  TaskData.swift
//  finalproj
//
//  Created by T Krobot on 14/11/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct TaskData: Identifiable, Codable {
    
    
    var id = UUID()

    var taskname: String
    var date = Date()
    
    
//    return .data { TaskData in
//                try? JSONEncoder().encode(TaskData)
//            }
    
}






