//
//  WaterAppApp.swift
//  WaterApp
//
//  Created by Aiur on 29.10.2020.
//

import SwiftUI

@main
struct WaterAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
