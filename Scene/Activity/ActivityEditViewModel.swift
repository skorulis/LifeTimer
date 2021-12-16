//
//  ActivityEditViewModel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation

final class ActivityEditViewModel: ObservableObject {
    
    private let activity: LifeActivity
    
    @Published var startTime: Date
    
    init(activity: LifeActivity) {
        self.activity = activity
        
        startTime = activity.startTime!
    }
    
}
