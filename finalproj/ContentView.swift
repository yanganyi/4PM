//
//  ContentView.swift
//  finalproj
//
//  Created by Yang An Yi on 11/11/24.
//SF symbol: sun.max, sunrise, sunset

import SwiftUI
import UserNotifications

struct ContentView: View {
    let center = UNUserNotificationCenter.current()
    
    @State private var authorizationStatus: UNAuthorizationStatus?
    
    var body: some View {
        HomeView()
            .task {
                let settings = await center.notificationSettings()
                authorizationStatus = settings.authorizationStatus
                
                if authorizationStatus == .authorized || authorizationStatus == .provisional {
                    let content = UNMutableNotificationContent()
                    content.title = "Daily Reminder"
                    content.body = "Plan your day now"
                    content.sound = .default
                    
                    let identifier = UUID().uuidString
                    var date = DateComponents()
                    date.hour = 14
                    date.minute = 15
                    print(date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                    
                    center.add(UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)) { error in
                        if let error = error {
                            print("Error scheduling notification: \(error)")
                        } else {
                            print("Notification scheduled successfully")
                        }
                    }
                }
            }
    }
}




#Preview {
    ContentView()
}
