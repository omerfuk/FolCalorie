//
//  FolCalorieApp.swift
//  FolCalorie
//
//  Created by Ömer Faruk Kılıçaslan on 28.07.2022.
//

import SwiftUI

@main
struct FolCalorieApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
