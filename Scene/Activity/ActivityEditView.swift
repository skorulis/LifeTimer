//
//  ActivityEditView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI
import ASSwiftUI

// MARK: - Memory footprint

struct ActivityEditView {
    
    @StateObject var viewModel: ActivityEditViewModel
    @Environment(\.as_presentation) var as_presentation
}

// MARK: - Rendering

extension ActivityEditView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker("Start time", selection: $viewModel.startTime, displayedComponents: [.date, .hourAndMinute])
                
                picker
                
                saveButton
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Activity")
    }
    
    private var picker: some View {
        DropdownPicker(
            label: "Label",
            selection: $viewModel.selectedLabel,
            options: viewModel.labels
        ) { item in
            LabelView(label: item)
        }
    }
    
    private var saveButton: some View {
        Button(action: save) {
            Text("Save")
        }
    }
}

// MARK: - Behaviors

private extension ActivityEditView {
    
    func save() {
        viewModel.save()
        as_presentation.dismiss()
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

