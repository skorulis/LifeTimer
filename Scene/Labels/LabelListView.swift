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
    
    @FetchRequest(
        entity: LifeLabel.entity(),
        sortDescriptors: []
    )
    var labels: FetchedResults<LifeLabel>
    
}

// MARK: - Rendering

extension LabelListView: View {
    
    var body: some View {
        NavigationView {
            mainContent
                .navigationTitle(Text("Labels"))
                .navigationBarItems(trailing: addButton)
        }
    }
    
    private var mainContent: some View {
        ZStack {
            list
            navigation
        }
    }
    
    private var list: some View {
        List {
            ForEach(labels) { label in
                cell(label)
            }
            .onDelete(perform: delete(at:))
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
    
    private func cell(_ label: LifeLabel) -> some View {
        Button(action: {viewModel.selectedLabel = label}) {
            Text("\(label.name ?? "")")
        }
    }
    
    
}

// MARK: - Behaviors

private extension LabelListView {
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let label = labels[index]
            label.managedObjectContext?.delete(label)
        }
        try! viewModel.db.container.viewContext.save()
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

