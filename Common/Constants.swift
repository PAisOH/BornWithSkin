//
//  Constants.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/22.
//

import SwiftUI

struct Constants {
    static let glassGradientLight = Gradient(colors: [Color("glassColor1"), Color("glassColor0")])
    static let glassGradientDark = Gradient(colors: [Color("glassColor2"), Color("glassColor1")])
    static let glassGradientShadow = Gradient(colors: [Color("glassColor2"), Color.primary, Color("glassColor2")])
    
    static let ingredClean:  [IngredientModel] = [
        IngredientModel(name: "Soap base", function: "", description: "", remark: "皂基"),
        IngredientModel(name: "SLS", function: "", description: "", remark: "月桂基硫酸钠 /十二烷基硫酸钠", alias: "Sodium Lauryl Sulfate"),
        
        IngredientModel(name: "Betaines", function: "", description: "", remark: "甜菜碱类"),
        IngredientModel(name: "Amino Acid", function: "", description: "", remark: "氨基酸"),
        
        IngredientModel(name: "APG", function: "Extremely mild, even milder than [Amino Acid]. But the milder the surfactant, the lower its cleaning power. And there will be a smooth membrane feeling after cleaning", description: "", remark: "APG葡糖苷类：极其温和，比氨基酸表面活性剂还要温和。清洁力度没有阴离子表面活性剂那么强，洁面后会有一种没洗干净，滑滑的膜感洁面后会有一种没洗干净，滑滑的膜感", alias: "Alkyl Polyglucoside"),
    ]
    
    static let ingredMoist: [IngredientModel] = [
        IngredientModel(name: "Hyaluronic Acid", function: "intense hydration", description: "A powerful hydrating ingredient that can hold up to 1000 times its weight in water.", remark: "玻尿酸"),
        IngredientModel(name: "Vitamin B5", function: "soothe, repair", description: "It helps to increase the skin's hydration levels.", remark: "泛醇", alias: "Panthenol"),
        IngredientModel(name: "Squalane", function: "keep hydrated, antioxidant", description: "A lightweight and non-greasy moisturizing ingredient that helps to lock in moisture.", remark: ""),
        IngredientModel(name: "Amino acid", function: "retain moisture, improve the overall hydration", description: "The building blocks of proteins, and play a crucial role in maintaining the skin's moisture barrier.", remark: "氨基酸"),
        IngredientModel(name: "Aloe", function: "soothe, hydrate, refresh", description: "A natural moisturizer that is rich in vitamins, minerals, and antioxidants.", remark: "芦荟"),
    ]
    
    static let ingredSuncreen: [IngredientModel] = [
        IngredientModel(name: "Zinc Oxide", function: "", description: "", remark: "氧化锌"),
        IngredientModel(name: "Titanium Dioxide", function: "", description: "", remark: "二氧化钛"),
    ]
    
    static let ingredGlow: [IngredientModel] = [
        IngredientModel(name: "Niacinamide", function: "", description: "", remark: "烟酰胺"),
        IngredientModel(name: "Vitamin C", function: "", description: "", remark: ""),
        IngredientModel(name: "Arbutin", function: "", description: "", remark: "熊果苷"),
        IngredientModel(name: "Kojic acid", function: "", description: "", remark: "曲酸"),
        IngredientModel(name: "TranexaMic Acid", function: "", description: "", remark: "传明酸/氨甲环酸")
    ]
    
    static let ingredAcne: [IngredientModel] = [
        IngredientModel(name: "Fruit Acid", function: "Exfoliates the skin, promotes the shedding of dead cells, and helps fade acne scars.", description: "", remark: "果酸", alias: "AHA"),
        IngredientModel(name: "Salicylic Acid", function: "Exfoliates the skin, promotes the shedding of dead cells deeply.", description: "", remark: "水杨酸", alias: "BHA"),
        IngredientModel(name: "Retinol", function: "Promotes cell turnover, accelerates exfoliation, and reduces acne formation.", description: "", remark: "A酸"),
        IngredientModel(name: "Amazonian White Clay", function: "Absorbs excess oil on the skin surface, reduces pore blockages.", description: "", remark: "亚马逊白泥"),
        IngredientModel(name: "Centella", function: "Antibacterial and anti-inflammatory, promotes skin repair and regeneration.", description: "", remark: "积雪草"),
        IngredientModel(name: "Chamomile", function: "Soothes itching, anti-inflammatory and calming.", description: "", remark: "洋甘菊")
    ]
    
    static let ingredRepair: [IngredientModel] = [
        IngredientModel(name: "Squalane", function: "Excellent penetration ability, moisturizing and hydrating", description: "Squalane is a natural skin moisturizer that can be extracted from olive oil.", remark: "角鲨烷"),
        IngredientModel(name: "Calendula", function: "skin repair and soothing sensitive skin", description: "It is a plant extract with anti-inflammatory and antibacterial properties.", remark: "金盏花"),
        IngredientModel(name: "Ceramide", function: "repair damaged skin barriers, lock in moisture, enhance skin's moisturizing ability, prevent water loss, and reduce dryness and roughness", description: "Ceramides are natural lipid components in the skin that are essential for maintaining the skin barrier function.", remark: "神经酰胺"),
        IngredientModel(name: "Glycerin", function: "attracts moisture from the air, maintains skin hydration", description: "Glycerin is a highly effective moisturizer with humectant properties that can be extracted from plant oils.", remark: "甘油"),
        IngredientModel(name: "Beta Glucan", function: "promotes skin repair and regeneration, reduces inflammatory reactions, soothes sensitive and damaged skin, enhances skin's immune function, improves skin's resistance", description: "Beta-glucan is a polysaccharide substance with anti-inflammatory and antioxidant properties that can be extracted from plants, yeast, or fungi.", remark: "beta 葡聚糖", alias: "Beta-Glucan")
    ]
    
    static let ingredAntiAging: [IngredientModel] = [
        IngredientModel(name: "Tocopherol", function: "", description: "", remark: "生育酚（维生素 E/抗氧化剂）"),
        IngredientModel(name: "Retinol", function: "", description: "", remark: "视黄醇（代表A醇）"),
        IngredientModel(name: "Peptide", function: "", description: "", remark: "胜肽"),
        IngredientModel(name: "Resveratrol", function: "", description: "", remark: "白藜芦醇")
    ]
}

typealias K = Constants
