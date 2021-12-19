//
//  ActivityViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import CoreData

final class ActivityViewModel: ObservableObject {
    
    @Published var selected: ContextObject<LifeActivity>?
    
    let db: PersistenceService
    
    init(db: PersistenceService) {
        self.db = db
    }
}

// MARK: - Behaviors

extension ActivityViewModel {
    
    func addActivity() {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = db.mainContext
        let activity = LifeActivity(context: context)
        activity.startTime = Date()
        selected = ContextObject(obj: activity)
    }
    
}
