//
//  TaskData.swift
//  finalproj
//
//  Created by T Krobot on 14/11/24.
//


import SwiftUI
import UniformTypeIdentifiers

struct TaskData: Identifiable, Codable, Transferable {
    var id = UUID()
    var taskname: String
    var date = Date()

  
    static var transferRepresentation: some TransferRepresentation {
      
        CodableRepresentation(contentType: .taskData)
    }
}


extension UTType {
    static let taskData = UTType(exportedAs: "com.tkrobot.finalproj.taskdata")
}
