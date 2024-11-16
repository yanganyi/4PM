//
//  AfternoonList.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct Afternoon: Identifiable, Codable, Transferable {
    var id = UUID()
    var taskname: String
    var date = Date()

  
    static var transferRepresentation: some TransferRepresentation {
      
        CodableRepresentation(contentType: .taskData)
    }
}

