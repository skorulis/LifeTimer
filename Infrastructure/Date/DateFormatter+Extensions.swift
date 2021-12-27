//
//  DateFormatter+Extensions.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 25/12/21.
//

import Foundation

extension DateFormatter {
    
    static func formatter(_ format: String) -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = format
        return df
    }
    
}
