//
//  MorningList.swift
//  finalproj
//
//  Created by Qi Yang on 11/11/24.
//

import SwiftUI

struct Morning: Identifiable {
    let id = UUID()

    var taskname: String
    var date = Date() // Link this with the data from home view
}
