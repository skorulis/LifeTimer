//
//  LabelEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI

final class LabelEditViewModel: ObservableObject {
    
    var label: LifeLabel
    private let db: PersistenceService
    
    @Published var name: String
    @Published var color = Color.red
    
    init(label: LifeLabel, db: PersistenceService) {
        self.label = label
        self.db = db
        self.name = label.name ?? ""
    }
}

// MARK: - Behaviors

extension LabelEditViewModel {
    
    func save() {
        self.label.name = self.name
        try! label.managedObjectContext?.save()
    }
    
}
