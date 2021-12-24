//
//  LifeLabel.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 19/12/21.
//

import Foundation
import CoreData
import ASSwiftUI
import SwiftUI

@objc(LifeLabel)
public class LifeLabel: NSManagedObject, Identifiable {
    
    @nonobjc class func fetch() -> NSFetchRequest<LifeLabel> {
        return NSFetchRequest<LifeLabel>(entityName: "LifeLabel")
    }
    
    @NSManaged public var name: String
    @NSManaged private var colorString: String
    
    public var color: Color {
        get {
            return Color(colorString) ?? Color.red
        }
        set {
            colorString = newValue.hexString
        }
    }
    
}

extension LifeLabel: Titleable {
    
    public var title: String { name }
    
}
