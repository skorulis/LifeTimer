//
//  LabelEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI
import CoreData

final class LabelEditViewModel: ObservableObject {
    
    var label: LifeLabel
    private let context: NSManagedObjectContext
    
    @Published var name: String
    @Published var color = Color.red
    
    init(label: ContextObject<LifeLabel>) {
        self.label = label.obj
        self.context = label.context
        self.name = label.obj.name ?? ""
    }
}

// MARK: - Behaviors

extension LabelEditViewModel {
    
    func save() {
        label.name = self.name
        
        try! label.managedObjectContext?.save()
        try! label.managedObjectContext?.parent?.save()
    }
    
    
}
