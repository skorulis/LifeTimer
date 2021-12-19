//
//  LabelView.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 19/12/21.
//

import SwiftUI

// MARK: - Memory footprint

struct LabelView {
    let label: LifeLabel
}

// MARK: - Rendering

extension LabelView: View {
    
    var body: some View {
        HStack {
            label.color
                .frame(width: 30, height: 30)
            Text("\(label.name)")
        }
    }
}
