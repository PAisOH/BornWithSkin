//
//  File.swift
//  
//
//  Created by Euan on 2024/2/3.
//

import SwiftUI

class ProductViewAbstract: Identifiable {
    public var id: Int
    public var cardColor: Color
    public var isLabel: Bool
    public var label: CustomLabel?
    public var isEnter: Bool = false
    public var typicalIngredients: [IngredientModel] = []
    public var bubbles: [SingleBubble] = []
    public var alertText: String = ""
    
    init(id: Int, cardColor: Color, isEnter: Bool) {
        self.id = id
        self.cardColor = cardColor
        self.isEnter = isEnter
        self.isLabel = false
    }
    
    init(id: Int, cardColor: Color, isLabel: Bool, label: CustomLabel, isEnter: Bool) {
        self.id = id
        self.cardColor = cardColor
        self.isLabel = isLabel
        self.label = label
        self.isEnter = isEnter
    }

    init(id: Int, cardColor: Color, isLabel: Bool, label: CustomLabel) {
        self.id = id
        self.cardColor = cardColor
        self.isLabel = isLabel
        self.label = label
    }

    init(id: Int, cardColor: Color, isLabel: Bool, label: CustomLabel, typicalIngredients: [IngredientModel], bubbles: [SingleBubble]) {
        self.id = id
        self.cardColor = cardColor
        self.isLabel = isLabel
        self.label = label
        self.typicalIngredients =  typicalIngredients
        self.bubbles = bubbles
    }
    
    init(id: Int, cardColor: Color, isLabel: Bool, label: CustomLabel, isEnter: Bool, typicalIngredients: [IngredientModel], bubbles: [SingleBubble]) {
        self.id = id
        self.cardColor = cardColor
        self.isLabel = isLabel
        self.label = label
        self.isEnter = isEnter
        self.typicalIngredients =  typicalIngredients
        self.bubbles = bubbles
    }

    init(id: Int, cardColor: Color, isLabel: Bool, label: CustomLabel, typicalIngredients: [IngredientModel], bubbles: [SingleBubble], alertText: String) {
        self.id = id
        self.cardColor = cardColor
        self.isLabel = isLabel
        self.label = label
        self.typicalIngredients =  typicalIngredients
        self.bubbles = bubbles
        self.alertText = alertText
    }
        
    func renderActiveView() -> AnyView{
        fatalError("Must Override")
    }
    
    func getCardColor() -> Color {
        cardColor
    }
}
