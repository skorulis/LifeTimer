//
//  ContextObject.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 9/12/2021.
//

import Foundation
import CoreData

struct ContextObject<Object: NSManagedObject> {
    
    let obj: Object
    let context: NSManagedObjectContext
    
    init(obj: Object) {
        self.obj = obj
        self.context = obj.managedObjectContext!
    }
    
}
