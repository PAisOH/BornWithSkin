//
//  File.swift
//  
//
//  Created by Euan on 2024/2/21.
//

import SwiftUI
import CoreData

@objc(ProgressCoreDataModel)
class ProgressCoreDataModel: NSManagedObject {
    @NSManaged var index: Int
    @NSManaged var isLearning: Bool
    @NSManaged var members : NSSet
//    @NSManaged var skinType: String
}

extension ProgressCoreDataModel: Identifiable {
    var id: Int {
        index
    }
    
    func addMember(values: NSSet) {
        var items = self.mutableSetValue(forKey: "members")
        for value in values {
            items.add(value)
        }
    }
    /// Remove a member from the team
    func removeMember(values: NSSet) {
        var items = self.mutableSetValue(forKey: "members")
        for value in values {
            items.remove(value)
        }
    }
}

