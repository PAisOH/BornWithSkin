//
//  File.swift
//  
//
//  Created by Euan on 2024/2/22.
//

import SwiftUI

class IngredientModel: Identifiable {
    public var id: UUID
    public var name: String
    public var function: String
    public var description: String
    public var remark: String
    public var alias: String?
    public var concentration: (Float, Float, Float)?    
    
    init(name: String, function: String, description: String, remark: String, alias: String? = nil, concentration: (Float, Float, Float)? = nil) {
        self.id = UUID()
        self.name = name
        self.function = function
        self.description = description
        self.remark = remark
        self.alias = alias
        self.concentration = concentration
    }
}
