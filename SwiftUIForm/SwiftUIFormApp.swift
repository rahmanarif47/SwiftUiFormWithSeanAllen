//
//  SwiftUIFormApp.swift
//  SwiftUIForm
//
//  Created by Arif Rahman Sidik on 15/05/21.
//

import SwiftUI

@main
struct SwiftUIFormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
