//
//  ActivityViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation

final class ActivityViewModel: ObservableObject {
    
    @Published var selected: LifeActivity?
    
    let db: PersistenceService
    
    init(db: PersistenceService) {
        self.db = db
    }
}

// MARK: - Behaviors

extension ActivityViewModel {
    
    func addActivity() {
        let activity = LifeActivity(context: db.mainContext)
        activity.startTime = Date()
        
        selected = activity
    }
    
}
