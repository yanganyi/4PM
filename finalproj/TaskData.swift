//
//  TaskData.swift
//  finalproj
//
//  Created by T Krobot on 14/11/24.
//

import SwiftUI

struct TaskData: Identifiable {
    let id = UUID()

    var taskname: String
    var date = Date()
}
