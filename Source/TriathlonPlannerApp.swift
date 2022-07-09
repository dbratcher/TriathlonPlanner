//
//  TriathlonPlannerApp.swift
//  Shared
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI

@main
struct TriathlonPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                GoalView().tabItem {
                    Label("Goals", systemImage: "timer")
                }

                TrainingView().tabItem {
                    Label("Training", systemImage: "calendar")
                }
                
                SettingsView().tabItem {
                    Label("Settings", systemImage: "gear")
                }
            }
        }
    }
}
