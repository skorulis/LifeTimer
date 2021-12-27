//
//  ActivityViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import CoreData

final class ActivityViewModel: ObservableObject {
    
    private static let dateFormatter = DateFormatter.formatter("d MMMM")
    
    @Published var selected: ContextObject<LifeActivity>?
    
    let activityProcessor: ActivityProcessor
    let db: PersistenceService
    
    init(db: PersistenceService,
         activityProcessor: ActivityProcessor
    ) {
        self.db = db
        self.activityProcessor = activityProcessor
    }
}

// MARK: - Logic

extension ActivityViewModel {
 
    var title: String {
        Self.dateFormatter.string(from: Date())
    }
    
}

// MARK: - Behaviors

extension ActivityViewModel {
    
    func onActivitySelection(_ activity: LifeActivity) {
        let context = db.childMainContext
        let childActivity = context.object(with: activity.objectID) as! LifeActivity
        selected = ContextObject(obj: childActivity)
    }
    
    func addActivity() {
        let context = db.childMainContext
        let activity = LifeActivity(context: context)
        activity.startTime = Date()
        selected = ContextObject(obj: activity)
    }
    
    func stopActivity() {
        activityProcessor.stopActivities()
    }
    
}
