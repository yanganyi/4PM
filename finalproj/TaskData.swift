//
//  TaskData.swift
//  finalproj
//
//  Created by T Krobot on 14/11/24.
//


import SwiftUI
import UniformTypeIdentifiers
import Observation

enum TimeFrame: Codable {
    case none, morning, afternoon, evening
    
    var title: String {
        switch self {
        case .none:
            return ""
        case .morning:
            return "Morning"
        case .afternoon:
            return "Afternoon"
        case .evening:
            return "Evening"
        }
    }
}

struct TaskData: Identifiable, Codable, Transferable {
    var id = UUID()
    var taskname: String
    var date = Date()
    var timeFrame: TimeFrame
    
    
    static var transferRepresentation: some TransferRepresentation {
        
        CodableRepresentation(contentType: .taskData)
    }
}

@Observable class TaskDataManager {
    var tasks: [TaskData] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    private func getArchiveURL() -> URL {
        URL.documentsDirectory.appending(path: "tasks.json")
    }
    
    private func save() {
        let archiveURL = getArchiveURL()
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        let encodedTaskDatas = try? jsonEncoder.encode(tasks)
        try? encodedTaskDatas?.write(to: archiveURL, options: .noFileProtection)
    }
    
    private func load() {
        let archiveURL = getArchiveURL()
        let jsonDecoder = JSONDecoder()
                
        if let retrievedTaskDataData = try? Data(contentsOf: archiveURL),
           let tasksDecoded = try? jsonDecoder.decode([TaskData].self, from: retrievedTaskDataData) {
            tasks = tasksDecoded
        }
    }
}


extension UTType {
    static let taskData = UTType(exportedAs: "com.tkrobot.finalproj.taskdata")
}
