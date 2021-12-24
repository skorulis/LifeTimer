//
//  ActivityEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Combine
import CoreData
import Foundation

final class ActivityEditViewModel: ObservableObject {
    
    private let activity: LifeActivity
    private let context: NSManagedObjectContext
    
    @Published var startTime: Date
    @Published var selectedLabel: LifeLabel?
    
    @Published var labels: [LifeLabel] = []
    
    private let labelFetch: FetchedResultsControllerPublisher<LifeLabel>
    private var subscribers: Set<AnyCancellable> = []
    
    init(activity: ContextObject<LifeActivity>) {
        self.activity = activity.obj
        self.context = activity.context
        
        startTime = self.activity.startTime!
        
        let fetch = LifeLabel.fetch()
        fetch.sortDescriptors = [.init(key: "name", ascending: true)]
        labelFetch = FetchedResultsControllerPublisher(request: fetch, context: self.context)
        labelFetch.publisher
            .assign(to: &$labels)
        
    }
    
}

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
