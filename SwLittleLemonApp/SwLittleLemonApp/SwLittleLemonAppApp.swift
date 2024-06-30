//
//  SwLittleLemonAppApp.swift
//  SwLittleLemonApp
//
//  Created by Arturo Camacho on 26/6/24.
//

import SwiftUI

@main
struct SwLittleLemonAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
