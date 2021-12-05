//
//  ContentView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    /*@Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \LifeActivity.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<LifeActivity>*/
    
    @EnvironmentObject var factory: GenericFactory

    var body: some View {
        TabView {
            ActivityView(viewModel: factory.resolve())
                .tabItem {
                    Label("Activities", systemImage: "play.fill")
                }
            
            LabelListView(viewModel: factory.resolve())
                .tabItem {
                    Label("Labels", systemImage: "character.cursor.ibeam")
                }
        }
    }

}
