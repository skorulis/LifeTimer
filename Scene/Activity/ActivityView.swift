//
//  ActivityView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI

// MARK: - Memory footprint

struct ActivityView {
 
    @StateObject var viewModel: ActivityViewModel
    @EnvironmentObject var factory: GenericFactory
    
}

// MARK: - Rendering

extension ActivityView: View {
    
    var body: some View {
        DayView(viewModel: factory.resolve())
    }
}

// MARK: - Previews

struct ActivityView_Previews: PreviewProvider {
    
    static var previews: some View {
        ActivityView(viewModel: IOC(testing: true).resolve(ActivityViewModel.self)!)
    }
}

