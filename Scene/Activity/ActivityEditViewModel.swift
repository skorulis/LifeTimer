//
//  ActivityEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Combine
import CoreData
import Foundation
import SwiftUI

final class ActivityEditViewModel: ObservableObject {
    
    private let activity: LifeActivity
    private let context: NSManagedObjectContext
    
    @Published var startTime: Date
    @Published var endTime: Date?
    @Published var selectedLabel: LifeLabel?
    
    @Published var labels: [LifeLabel] = []
    
    private let labelFetch: FetchedResultsControllerPublisher<LifeLabel>
    private var subscribers: Set<AnyCancellable> = []
    
    init(activity: ContextObject<LifeActivity>) {
        self.activity = activity.obj
        self.context = activity.context
        
        selectedLabel = self.activity.label
        startTime = self.activity.startTime
        endTime = self.activity.endTime
        
        let fetch = LifeLabel.fetch()
        fetch.sortDescriptors = [.init(key: "name", ascending: true)]
        labelFetch = FetchedResultsControllerPublisher(request: fetch, context: self.context)
        labelFetch.publisher
            .assign(to: &$labels)
        
    }
    
}

// MARK: - Logic

extension ActivityEditViewModel {
    
    var finishedBinding: Binding<Bool> {
        return Binding<Bool> { [unowned self] in
            return self.endTime != nil
        } set: { [unowned self] newValue in
            if newValue {
                self.endTime = Date()
            } else {
                self.endTime = nil
            }
        }
    }
    
    var endTimeBinding: Binding<Date> {
        return Binding<Date> { [unowned self] in
            return self.endTime ?? Date()
        } set: { [unowned self] newValue in
            self.endTime = newValue
        }
    }
    
}

// MARK: - Behaviors

extension ActivityEditViewModel {
    
    func save() {
        guard let label = selectedLabel else {
            return // TODO: Handle errors
        }
        
        activity.label = label
        activity.startTime = startTime
        
        try! activity.managedObjectContext?.save()
        try! activity.managedObjectContext?.parent?.save()
    }
    
}
