//
//  LabelEditView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI

// MARK: - Memory footprint

struct LabelEditView {
    
    @StateObject var viewModel: LabelEditViewModel
    
}

// MARK: - Rendering

extension LabelEditView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                nameField
                ColorPicker("Color", selection: $viewModel.color)
                Spacer()
                saveButton
            }
            .padding(.horizontal)
        }
        .navigationTitle(Text("New"))
    }
    
    private var nameField: some View {
        TextField("Label", text: $viewModel.label)
    }
    
    private var saveButton: some View {
        Button(action: viewModel.save) {
            Text("Save")
        }
    }
}

// MARK: - Previews

struct LabelEditView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        let viewModel = ioc.factory.resolve(LabelEditViewModel.self)
        NavigationView {
            LabelEditView(viewModel: viewModel)
        }
        
    }
}

