//  informaticsApp.swift
//  informatics
//
//  Created by Алёша Виноградов on 05.07.2023.
//

import SwiftUI

@main
struct informaticsApp: App {
//    @State static var coordinator = HomeCoordinator()
    @StateObject var coordinator = Coordinator()
    let persistenceController = PersistenceController.shared
    var body: some Scene {
       
        WindowGroup {
            
           HomeCoordinatorView()
                .environmentObject(coordinator)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}
