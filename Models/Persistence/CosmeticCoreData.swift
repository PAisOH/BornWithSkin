//
//  File.swift
//  
//
//  Created by Euan on 2024/2/16.
//

import SwiftUI
import CoreData

@objc(CosmeticCoreDataModel)
class CosmeticCoreDataModel: NSManagedObject {
    @NSManaged var index: Int
    @NSManaged var label: String
    @NSManaged var brand: String
    @NSManaged var name: String
    @NSManaged var price: Int
    @NSManaged var rank: Double
    @NSManaged var ingredients: [String]
    @NSManaged var combination, dry, normal, oily, sensitive: Bool
    @NSManaged var inCleanser, inMoist, inSuncreen, inBrighten, inAcne, inRepair, inAntiAging: Bool
    @NSManaged var teams : NSSet
}

extension CosmeticCoreDataModel: Identifiable {
    var id: Int {
        index
    }
    
    /// Add a team to the person
    func addMTeam(values: NSSet) {
        var items = self.mutableSetValue(forKey: "teams")
        for value in values {
            items.add(value)
        }
    }
    
    /// Remove a team from the person
    func removeTeam(values: NSSet) {
        var items = self.mutableSetValue(forKey: "teams")
        for value in values {
            items.remove(value)
        }
    }

}
