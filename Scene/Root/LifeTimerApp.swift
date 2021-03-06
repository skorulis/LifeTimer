//
//  LifeTimerApp.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI

@main
struct LifeTimerApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(IOC.shared.container.resolve(GenericFactory.self)!)
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
    
    private var persistence: PersistenceService {
        return IOC.shared.resolve(PersistenceService.self)!
    }
}
