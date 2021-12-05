//
//  LabelEditView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI
import ASSwiftUI

// MARK: - Memory footprint

struct LabelEditView {
    
    @StateObject var viewModel: LabelEditViewModel
    @Environment(\.as_presentation) var as_presentation
    
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
        TextField("Label", text: $viewModel.name)
    }
    
    private var saveButton: some View {
        Button(action: save) {
            Text("Save")
        }
    }
}

// MARK: - Behaviors

private extension LabelEditView {
    
    func save() {
        viewModel.save()
        self.as_presentation.dismiss()
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

