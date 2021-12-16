//
//  LabelListViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import CoreData

final class LabelListViewModel: ObservableObject {
    
    @Published var selectedLabel: ContextObject<LifeLabel>?
    let db: PersistenceService
    
    init(db: PersistenceService) {
        self.db = db
    }
    
    
}

// MARK: - Behaviors

extension LabelListViewModel {

    func newLabel() {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = db.mainContext
        let label = LifeLabel(context: context)
        selectedLabel = ContextObject(obj: label)
    }

}


