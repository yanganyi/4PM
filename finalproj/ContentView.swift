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
        VStack {
            if authorizationStatus == .authorized {
                HomeView()
            } else {
                Button("Request Notification Permission") {
                    Task {
                        do {
                            try await center.requestAuthorization(options: [.alert, .sound, .badge])
                            let settings = await center.notificationSettings()
                            authorizationStatus = settings.authorizationStatus
                        } catch {
//                            it there is erros fix them here
                        }
                    }
                }
                .padding()
                
                if authorizationStatus == .denied {
                    Text("Notifications are denied. Please enable them in settings.")
                        .foregroundColor(.red)
                }
            }
        }
        .task {
            let settings = await center.notificationSettings()
            authorizationStatus = settings.authorizationStatus
            if authorizationStatus == .authorized {
                scheduleDailyNotification()
            }
        }
    }
    private func scheduleDailyNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time to plan your day"
        content.body = "Don't forget to plan your tasks for the day!"
        content.sound = .default
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 32
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "DailyPlanNotification", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}



#Preview {
    ContentView()
}
