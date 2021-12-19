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
    @Published var selectedLabel: LifeLabel
    
    @Published var labels: [LifeLabel] = []
    
    private let labelFetch: FetchedResultsControllerPublisher<LifeLabel>
    private var subscribers: Set<AnyCancellable> = []
    
    init(activity: ContextObject<LifeActivity>) {
        self.activity = activity.obj
        self.context = activity.context
        
        startTime = self.activity.startTime!
        selectedLabel = LifeLabel(context: self.context)
        
        let fetch = LifeLabel.fetch()
        fetch.sortDescriptors = [.init(key: "name", ascending: true)]
        labelFetch = FetchedResultsControllerPublisher(request: fetch, context: self.context)
        labelFetch.publisher
            .assign(to: &$labels)
        
    }
    
}
