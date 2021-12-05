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
            hours
        }
    }
    
    private var hours: some View {
        VStack(spacing: 0) {
            ForEach(0..<24) { hour in
                hourMarker(hour: hour)
            }
        }
    }
    
    private func hourMarker(hour: Int) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(String(format: "%02d", hour)):00")
                    //.opacity(hour == 0 ? 0 : 1)
                    .padding(.leading, 8)
                Rectangle()
                    .frame(height: 0.5)
            }
            Spacer()
        }
        .frame(height: 64)
    }
}

// MARK: - Previews

struct DayView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC(testing: true)
        let viewModel = ioc.resolve(DayViewModel.self)!
        DayView(viewModel: viewModel)
    }
}

