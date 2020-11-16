//
//  WaterAppApp.swift
//  WaterApp
//
//  Created by Aiur on 29.10.2020.
//

import SwiftUI

@main
struct WaterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
//            ProgressRectangleView(progress: 0.8, animated: false)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
