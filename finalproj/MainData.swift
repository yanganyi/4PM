import SwiftUI

struct MainData: Identifiable {
    let id = UUID()

    var title: String
    var date: String // Link this with the data from home view
}
