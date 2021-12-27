//
//  LifeActivity.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 24/12/21.
//

import Foundation
import CoreData
import ASSwiftUI
import SwiftUI

@objc(LifeActivity)
public class LifeActivity: NSManagedObject, Identifiable {
    
    @nonobjc class func fetch() -> NSFetchRequest<LifeActivity> {
        return NSFetchRequest<LifeActivity>(entityName: "LifeActivity")
    }
    
    @NSManaged public var startTime: Date
    @NSManaged public var endTime: Date?
    
    @NSManaged public var label: LifeLabel
    
}
