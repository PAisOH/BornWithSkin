//
//  File.swift
//  
//
//  Created by Euan on 2024/2/16.
//

import SwiftUI
import CoreData

// that file are the same file that xcode generated when Core Data option checked

// here the code

class Persistence {
    static let shared = Persistence()
    
    let container : NSPersistentContainer
    
    @State private var isFirstLaunch: Bool
    
    init(inMemory: Bool = false) {
        let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        _isFirstLaunch = State(initialValue: isFirstLaunch)
        print("isFirstLaunch:", isFirstLaunch)

        if NSPersistentContainer(name: "ProgressCoreDataModel", managedObjectModel: Persistence.createProgressModel()).viewContext.isMember(of: CosmeticCoreDataModel.self) {
            print("^^^YES")
        } else {
            print("^^^NO")
        }
        
        let container = NSPersistentContainer(name: "ProgressCoreDataModel", managedObjectModel: Persistence.createProgressModel())
        
        if !_isFirstLaunch.wrappedValue {

            print(">>>isFirstLaunch", UserDefaults.standard.bool(forKey: "isFirstLaunch"))

            let context = container.viewContext
            let cosmetics: [CosmeticModel] = Bundle.main.decode("cosmetics_samples.json")
            let progress1 = ProgressCoreDataModel(context: context)
            progress1.index = 1
            progress1.isLearning = false
            
            let progress2 = ProgressCoreDataModel(context: context)
            progress2.index = 2
            progress2.isLearning = false
            
            let progress3 = ProgressCoreDataModel(context: context)
            progress3.index = 3
            progress3.isLearning = false
            
            let progress4 = ProgressCoreDataModel(context: context)
            progress4.index = 4
            progress4.isLearning = false
            
            let progress5 = ProgressCoreDataModel(context: context)
            progress5.index = 5
            progress5.isLearning = false
            
            let progress6 = ProgressCoreDataModel(context: context)
            progress6.index = 6
            progress6.isLearning = false
            
            let progress7 = ProgressCoreDataModel(context: context)
            progress7.index = 7
            progress7.isLearning = false
            for index in 0 ..< cosmetics.count {
                let task = CosmeticCoreDataModel(context: context)
                var cosmetic = cosmetics[index]
                task.index = cosmetic.id
                task.label = cosmetic.label.rawValue
                task.brand = cosmetic.brand
                task.name = cosmetic.name
                task.price = cosmetic.price
                task.rank = cosmetic.rank
                task.ingredients = cosmetic.ingredients
                
                task.combination = cosmetic.combination != 0
                task.dry = cosmetic.dry != 0
                task.normal = cosmetic.normal != 0
                task.oily = cosmetic.oily != 0
                task.sensitive = cosmetic.sensitive != 0
                
                task.inCleanser = cosmetic.inCleanser != 0
                task.inMoist = cosmetic.inMoist != 0
                task.inSuncreen = cosmetic.inSuncreen != 0
                task.inAcne = cosmetic.inAcne != 0
                task.inBrighten = cosmetic.inBrighten != 0
                task.inRepair = cosmetic.inRepair != 0
                task.inAntiAging = cosmetic.inAntiAging != 0
                
                var progresses: [ProgressCoreDataModel] = []

                
                if(task.inCleanser) {

                    progress1.addMember(values: NSSet(array: [task]))
                    progresses.append(progress1)
                }
                if(task.inMoist) {

                    progress2.addMember(values: NSSet(array: [task]))
                    progresses.append(progress2)
                }
                if(task.inSuncreen) {

                    progress3.addMember(values: NSSet(array: [task]))
                    progresses.append(progress3)
                }
                if(task.inAcne) {

                    progress4.addMember(values: NSSet(array: [task]))
                    progresses.append(progress4)
                }
                if(task.inBrighten) {

                    progress5.addMember(values: NSSet(array: [task]))
                    progresses.append(progress5)
                }
                if(task.inRepair) {

                    progress6.addMember(values: NSSet(array: [task]))
                    progresses.append(progress6)
                }
                if(task.inAntiAging) {

                    progress7.addMember(values: NSSet(array: [task]))
                    progresses.append(progress7)
                }
                print("\(task.name) &&& \(progresses.count)")

                
                task.addMTeam(values: NSSet(array: progresses))
                context.perform {
                    try! context.save()
                }
            }
            
            
        }

        
        if inMemory {
            
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            
            if let error = error {
                fatalError("failed with \(error.localizedDescription)")
            }
            print("NO ERROR")

        }
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
//        UserDefaults.standard.set(!isFirstLaunch, forKey: "isFirstLaunch")

        
        self.container = container
    }

}

extension Persistence {
    static func createProgressModel() -> NSManagedObjectModel {
        let progressEntity = NSEntityDescription()
        progressEntity.name = "ProgressCoreDataModel"
        progressEntity.managedObjectClassName = "ProgressCoreDataModel"
        
        let progressIndexAttribute = NSAttributeDescription()
        progressIndexAttribute.name = "index"
        progressIndexAttribute.type = .integer64
        progressEntity.properties.append(progressIndexAttribute)
        
        let progressisLearningAttribute = NSAttributeDescription()
        progressisLearningAttribute.name = "isLearning"
        progressisLearningAttribute.type = .boolean
        progressEntity.properties.append(progressisLearningAttribute)
        
        // MARK:
        let model = NSManagedObjectModel()
        
        // MARK:
        let cosmeticEntity = Persistence.createCosmeticEntity()
        
        let memberRelation = NSRelationshipDescription()
        memberRelation.destinationEntity = cosmeticEntity
        memberRelation.name = "members"
        memberRelation.minCount = 0
        memberRelation.maxCount = 0
        memberRelation.isOptional = true
        memberRelation.deleteRule = .nullifyDeleteRule
        
        let teamRelation = NSRelationshipDescription()
        teamRelation.destinationEntity = progressEntity
        teamRelation.name = "teams"
        teamRelation.minCount = 0
        teamRelation.maxCount = 0
        teamRelation.isOptional = true
        teamRelation.deleteRule = .nullifyDeleteRule
        
        memberRelation.inverseRelationship = teamRelation
        teamRelation.inverseRelationship = memberRelation
        
        progressEntity.properties.append(memberRelation)
        cosmeticEntity.properties.append(teamRelation)
        
        model.entities = [progressEntity, cosmeticEntity]

        return model
    }
    
    static func createCosmeticEntity() -> NSEntityDescription {
        let cosmeticEntity = NSEntityDescription()
        cosmeticEntity.name = "CosmeticCoreDataModel"
        cosmeticEntity.managedObjectClassName = "CosmeticCoreDataModel"
        
        let indexAttribute = NSAttributeDescription()
        indexAttribute.name = "index"
        indexAttribute.type = .integer64
        cosmeticEntity.properties.append(indexAttribute)
        
        let labelAttribute = NSAttributeDescription()
        labelAttribute.name = "label"
        labelAttribute.type = .string
        cosmeticEntity.properties.append(labelAttribute)
        
        let brandAttribute = NSAttributeDescription()
        brandAttribute.name = "brand"
        brandAttribute.type = .string
        cosmeticEntity.properties.append(brandAttribute)
        
        let nameAttribute = NSAttributeDescription()
        nameAttribute.name = "name"
        nameAttribute.type = .string
        cosmeticEntity.properties.append(nameAttribute)

        let priceAttribute = NSAttributeDescription()
        priceAttribute.name = "price"
        priceAttribute.type = .integer64
        cosmeticEntity.properties.append(priceAttribute)
        
        let rankAttribute = NSAttributeDescription()
        rankAttribute.name = "rank"
        rankAttribute.type = .double
        cosmeticEntity.properties.append(rankAttribute)
        
        let ingredientsAttribute = NSAttributeDescription()
        ingredientsAttribute.name = "ingredients"
        ingredientsAttribute.type = .transformable
        cosmeticEntity.properties.append(ingredientsAttribute)
        
        let combinationAttribute = NSAttributeDescription()
        combinationAttribute.name = "combination"
        combinationAttribute.type = .boolean
        cosmeticEntity.properties.append(combinationAttribute)

        let dryAttribute = NSAttributeDescription()
        dryAttribute.name = "dry"
        dryAttribute.type = .boolean
        cosmeticEntity.properties.append(dryAttribute)
        
        let normalAttribute = NSAttributeDescription()
        normalAttribute.name = "normal"
        normalAttribute.type = .boolean
        cosmeticEntity.properties.append(normalAttribute)
        
        let oilyAttribute = NSAttributeDescription()
        oilyAttribute.name = "oily"
        oilyAttribute.type = .boolean
        cosmeticEntity.properties.append(oilyAttribute)
        
        let sensitiveAttribute = NSAttributeDescription()
        sensitiveAttribute.name = "sensitive"
        sensitiveAttribute.type = .boolean
        cosmeticEntity.properties.append(sensitiveAttribute)
        
        let inCleanserAttribute = NSAttributeDescription()
        inCleanserAttribute.name = "inCleanser"
        inCleanserAttribute.type = .boolean
        cosmeticEntity.properties.append(inCleanserAttribute)
        
        let inMoistAttribute = NSAttributeDescription()
        inMoistAttribute.name = "inMoist"
        inMoistAttribute.type = .boolean
        cosmeticEntity.properties.append(inMoistAttribute)
        
        let inSuncreenAttribute = NSAttributeDescription()
        inSuncreenAttribute.name = "inSuncreen"
        inSuncreenAttribute.type = .boolean
        cosmeticEntity.properties.append(inSuncreenAttribute)
        
        let inBrightenAttribute = NSAttributeDescription()
        inBrightenAttribute.name = "inBrighten"
        inBrightenAttribute.type = .boolean
        cosmeticEntity.properties.append(inBrightenAttribute)
        
        let inAcneAttribute = NSAttributeDescription()
        inAcneAttribute.name = "inAcne"
        inAcneAttribute.type = .boolean
        cosmeticEntity.properties.append(inAcneAttribute)
        
        let inRepairAttribute = NSAttributeDescription()
        inRepairAttribute.name = "inRepair"
        inRepairAttribute.type = .boolean
        cosmeticEntity.properties.append(inRepairAttribute)
        
        let inAntiAgingAttribute = NSAttributeDescription()
        inAntiAgingAttribute.name = "inAntiAging"
        inAntiAgingAttribute.type = .boolean
        cosmeticEntity.properties.append(inAntiAgingAttribute)
        
        return cosmeticEntity
    }
}

