//
//  ActivityView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI
import ASSwiftUI

// MARK: - Memory footprint

struct ActivityView {
 
    @StateObject var viewModel: ActivityViewModel
    @EnvironmentObject var factory: GenericFactory
    
}

// MARK: - Rendering

extension ActivityView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                DayView(viewModel: factory.resolve())
                controls
                navigation
            }
        }
        
    }
    
    private var controls: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: viewModel.addActivity) {
                    Image(systemName: "plus.circle")
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
        }
    }
    
    private var navigation: some View {
        NavigationHelper.invisible(selection: $viewModel.selected) { activity in
            ActivityEditView(viewModel: factory.resolve(ActivityEditViewModel.self, argument: activity))
        }
    }
}

// MARK: - Previews

struct ActivityView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        ActivityView(viewModel: ioc.resolve(ActivityViewModel.self)!)
    }
}

