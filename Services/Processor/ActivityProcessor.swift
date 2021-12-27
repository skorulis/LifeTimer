//
//  ActivityProcessor.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 25/12/21.
//

import Foundation

struct ActivityProcessor {
    
    let db: PersistenceService
    
    func stopActivities() {
        let context = db.mainContext
        
        let fetch = LifeActivity.fetch()
        fetch.predicate = NSPredicate(format: "endTime == NULL")
        
        let ongoing = try! context.fetch(fetch)
        for activity in ongoing {
            activity.endTime = Date()
        }
        try! context.save()
        
    }
}
