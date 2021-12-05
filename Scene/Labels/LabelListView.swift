//
//  LabelListView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI
import ASSwiftUI

// MARK: - Memory footprint

struct LabelListView {
    
    @StateObject var viewModel: LabelListViewModel
    @EnvironmentObject var factory: GenericFactory
    
}

// MARK: - Rendering

extension LabelListView: View {
    
    var body: some View {
        NavigationView {
            list
                .navigationTitle(Text("Labels"))
                .navigationBarItems(trailing: addButton)
        }
    }
    
    private var list: some View {
        List {
            navigation
            Text("Hello")
        }
    }
    
    private var addButton: some View {
        Button(action: viewModel.newLabel) {
            Image(systemName: "plus.circle")
        }
    }
    
    private var navigation: some View {
        NavigationHelper.invisible(selection: $viewModel.selectedLabel) { label in
            LabelEditView(viewModel: factory.resolve(LabelEditViewModel.self, argument: label))
        }
    }
}

// MARK: - Previews

struct LabelListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        let viewModel = ioc.factory.resolve(LabelListViewModel.self)
        LabelListView(viewModel: viewModel)
    }
}

