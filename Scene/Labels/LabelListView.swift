//
//  LabelListView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct LabelListView {
    
    @StateObject var viewModel: LabelListViewModel
    
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
            Text("Hello")
        }
    }
    
    private var addButton: some View {
        Button(action: {}) {
            Image(systemName: "plus.circle")
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

