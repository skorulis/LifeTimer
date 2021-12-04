//
//  DayView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct DayView {
    
    @StateObject var viewModel: DayViewModel
    
}

// MARK: - Rendering

extension DayView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<24) { hour in
                    Text("\(hour        )")
                }
            }
        }
        EmptyView()
    }
}

// MARK: - Previews

struct DayView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        //let viewModel = ioc.factory.resolve(DayViewModel.self)
        let viewModel = DayViewModel()
        DayView(viewModel: viewModel)
    }
}

