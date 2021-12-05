//
//  LabelEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI

final class LabelEditViewModel: ObservableObject {
    
    var original: LifeLabel
    private let db: PersistenceService
    
    @Published var label: String
    @Published var color = Color.red
    
    init(label: LifeLabel, db: PersistenceService) {
        self.original = label
        self.db = db
        self.label = label.label ?? ""
    }
}

// MARK: - Behaviors

extension LabelEditViewModel {
    
    func save() {
        self.original.label = self.label
        try! self.original.managedObjectContext?.save()
    }
    
}
