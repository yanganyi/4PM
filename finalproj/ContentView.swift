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
    @State private var taskManager = TaskDataManager()

    var body: some View {
        HomeView()
            .task {
                let settings = await center.notificationSettings()
                authorizationStatus = settings.authorizationStatus
                
                if authorizationStatus == .authorized || authorizationStatus == .provisional  {
                    let content = UNMutableNotificationContent()
                    content.title = "Daily Reminder"
                    content.body = "Plan your day now"
                    content.sound = .default
                    
                    
                    let identifier = UUID().uuidString
                    var date = DateComponents()
                    date.hour = 7
                    date.minute = 0
                    print(date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                    
                    DispatchQueue.main.async {
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
        
            .task {
                let settings = await center.notificationSettings()
                authorizationStatus = settings.authorizationStatus
                
                if authorizationStatus == .authorized || authorizationStatus == .provisional  {
                    let content = UNMutableNotificationContent()
                    content.title = "Daily Reminder"
                    content.body = "Time for your afternoon tasks :D"
                    content.sound = .default
                    
                    
                    let identifier = UUID().uuidString
                    var date = DateComponents()
                    date.hour = 12
                    date.minute = 0
                    print(date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                    
                    DispatchQueue.main.async {
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
            .task {
                let settings = await center.notificationSettings()
                authorizationStatus = settings.authorizationStatus
                
                if authorizationStatus == .authorized || authorizationStatus == .provisional  {
                    let content = UNMutableNotificationContent()
                    content.title = "Daily Reminder"
                    content.body = "Finish up those Evening tasks :b"
                    content.sound = .default
                    
                    
                    let identifier = UUID().uuidString
                    var date = DateComponents()
                    date.hour = 5
                    date.minute = 00
                    print(date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                    
                    DispatchQueue.main.async {
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
}




#Preview {
    ContentView()
}
