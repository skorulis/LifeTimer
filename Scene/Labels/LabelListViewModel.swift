//
//  LabelListViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation

final class LabelListViewModel: ObservableObject {
    
    @Published var selectedLabel: LifeLabel?
    private let db: PersistenceService
    
    init(db: PersistenceService) {
        self.db = db
    }
    
    
}

// MARK: - Behaviors

extension LabelListViewModel {

    func newLabel() {
        selectedLabel = LifeLabel(context: db.container.viewContext)
    }
    
}


