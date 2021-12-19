//
//  ActivityEditView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI

// MARK: - Memory footprint

struct ActivityEditView {
    
    @StateObject var viewModel: ActivityEditViewModel
}

// MARK: - Rendering

extension ActivityEditView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker("Start time", selection: $viewModel.startTime, displayedComponents: [.date, .hourAndMinute])
                
                Picker("Label", selection: $viewModel.selectedLabel) {
                    ForEach(viewModel.labels) { label in
                        LabelView(label: label)
                            .tag(label)
                    }
                }
                .pickerStyle(.wheel)

            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Activity")
    }
}

// MARK: - Previews

struct ActivityEditView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        let viewModel = ioc.resolve(ActivityEditViewModel.self)!
        ActivityEditView(viewModel: viewModel)
    }
}

