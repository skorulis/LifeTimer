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
            ZStack(alignment: .top) {
                hours
                activities
            }
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
    
    private var activities: some View {
        ForEach(viewModel.dailyActivities) { item in
            activityItem(item)
        }
    }
    
    private func activityItem(_ item: LifeActivity) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(item.label.color.opacity(0.5))
            .overlay(
                Text(item.label.name)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.onSelection(item)
            }
            .frame(height: height(activity: item))
            .offset(y: yDistance(time: item.startTime))
            .padding(.leading, 60)
            .padding(.trailing, 10)
            
    }
}

// MARK: - Logic

private extension DayView {
    
    func height(activity: LifeActivity) -> CGFloat {
        let endTime = activity.endTime ?? Date()
        let height = yDistance(time: endTime) - yDistance(time: activity.startTime)
        return max(height, 20)
    }
    
    func yDistance(time: Date) -> CGFloat {
        let secondPixels = CGFloat(64) / 3600
        let seconds = time.timeIntervalSince1970 - viewModel.dayStart.timeIntervalSince1970
        let pixels = CGFloat(seconds) * secondPixels
        return max(pixels, 0)
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

