//
//  File.swift
//  
//
//  Created by Euan on 2024/2/15.
//


//   let cosmetic = try? JSONDecoder().decode(Cosmetic.self, from: jsonData)

import SwiftUI

class CosmeticModel: Codable {
    let id: Int
    let label: Label
    let brand, name: String
    let price: Int
    let rank: Double
    let ingredients: [String]
    
    let combination, dry, normal, oily, sensitive: Int
    
    let inCleanser, inMoist, inSuncreen, inBrighten, inAcne, inRepair, inAntiAging: Int

    enum CodingKeys: String, CodingKey {
        case id
        case label = "Label"
        case brand = "Brand"
        case name = "Name"
        case price = "Price"
        case rank = "Rank"
        case ingredients = "Ingredients"
        case combination = "Combination"
        case dry = "Dry"
        case normal = "Normal"
        case oily = "Oily"
        case sensitive = "Sensitive"
        case inCleanser = "in_cleanser"
        case inMoist = "in_moist"
        case inSuncreen = "in_suncreen"
        case inBrighten = "in_brighten"
        case inAcne = "in_acne"
        case inRepair = "in_repair"
        case inAntiAging = "in_anti_aging"
    }
}

enum Label: String, Codable, CaseIterable {
    case cleanser = "Cleanser"
    case eyeCream = "Eye cream"
    case faceMask = "Face Mask"
    case moisturizer = "Moisturizer"
    case sunProtect = "Sun protect"
    case treatment = "Treatment"
}

typealias Cosmetic = [CosmeticModel]
