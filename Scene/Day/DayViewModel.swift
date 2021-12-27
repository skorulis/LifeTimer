//
//  DayViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation

final class DayViewModel: ObservableObject {
    
    let db: PersistenceService
    let dayStart: Date = Date().startOfDay
    let onSelection: SelectionType
    
    @Published var dailyActivities: [LifeActivity] = []
    
    private let activityFetch: FetchedResultsControllerPublisher<LifeActivity>
    
    init(onSelection: @escaping SelectionType,
        db: PersistenceService
    ) {
        self.onSelection = onSelection
        self.db = db
        
        let fetch = LifeActivity.fetch()
        fetch.sortDescriptors = [.init(key: "startTime", ascending: true)]
        //fetch.predicate = NSPredicate(format: "startTime >= %@ AND endTime <= %@ ", <#T##args: CVarArg...##CVarArg#>)
        activityFetch = FetchedResultsControllerPublisher(request: fetch, context: db.mainContext)
        activityFetch.publisher
            .assign(to: &$dailyActivities)
    }
    
}

// MARK: - Inner types

extension DayViewModel {
 
    typealias SelectionType = (LifeActivity) -> ()
    
}

// MARK: - Logic

extension DayViewModel {
    
    var dayEnd: Date {
        return dayStart.endOfDay
    }
}
