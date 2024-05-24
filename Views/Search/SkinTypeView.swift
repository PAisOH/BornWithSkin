//
//  File.swift
//  
//
//  Created by Euan on 2024/2/18.
//

import SwiftUI


struct SkinTypeView: View {
    @EnvironmentObject var globalVariables: GlobalVariables

    var cosmetic: CosmeticCoreDataModel
    @State private var count: Int = 0
    
    var body: some View {
        HStack(spacing: -6) {
            if (!cosmetic.combination && !cosmetic.dry && !cosmetic.normal && !cosmetic.oily && !cosmetic.sensitive) {
                Text("Unknown")
            }
            else if !cosmetic.combination {
                Text("Combination")
                    .modifier(SkinTypeColorWarn(currentType: "combination"))
            }
            else if !cosmetic.dry {
                Text("dry")
                    .modifier(SkinTypeColorWarn(currentType: "dry"))
            }
            else if !cosmetic.normal {
                Text("normal")
                    .modifier(SkinTypeColorWarn(currentType: "normal"))
            }
            else if !cosmetic.oily {
                Text("oily")
                    .modifier(SkinTypeColorWarn(currentType: "oily"))
            }
            else if !cosmetic.sensitive {
                Text("sensitive")
                    .modifier(SkinTypeColorWarn(currentType: "sensitive"))
            }
        }
    }
}


struct SkinTypeViewSheet: View {
    
    var cosmetic: CosmeticCoreDataModel
    @State private var count: Int = 0
    
    var body: some View {
        HStack(spacing: -6) {
            if (!cosmetic.combination && !cosmetic.dry && !cosmetic.normal && !cosmetic.oily && !cosmetic.sensitive) {
                Text("Unknown")
            }
            else if !cosmetic.combination {
                Text("combination")
                    .modifier(SkinTypeColorWarn(currentType: "combination"))

//                    .strikethrough()
            }
            else if !cosmetic.dry {
                Text("dry")
                    .modifier(SkinTypeColorWarn(currentType: "dry"))

            }
            else if !cosmetic.normal {
                Text("normal")
                    .modifier(SkinTypeColorWarn(currentType: "normal"))
            }
            else if !cosmetic.oily {
                Text("oily")
                    .modifier(SkinTypeColorWarn(currentType: "oily"))

            }
            else if !cosmetic.sensitive {
                Text("sensitive")
                    .modifier(SkinTypeColorWarn(currentType: "sensitive"))
            }
        }
    }
}

struct SkinTypeColorWarn: ViewModifier {
    @EnvironmentObject var globalVariables: GlobalVariables

    var currentType: String
    
    func body(content: Content) -> some View {
        Group {
            if globalVariables.skinType.lowercased() == currentType.lowercased() {
                content
                    .bold()
                    .foregroundStyle(.red)            
            } else {
                content
            }
        }
    }
}

