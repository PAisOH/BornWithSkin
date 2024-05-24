//
//  SwiftUIView.swift
//  
//
//  Created by Euan on 2024/2/17.
//

import SwiftUI

struct CosmeticSheetView: View {
    @Binding var isPresented: Bool

    var cosmetic: CosmeticCoreDataModel
    
    var body: some View {
        let cosmeticLabel = Label(rawValue: cosmetic.label)

        VStack(alignment: .leading) {
            Button {
                isPresented = false
            } label: {
                Text("Close")
                    .bold()
                    .foregroundStyle(.secondary)
            }
            
            if cosmeticLabel == Label.cleanser {
                LotionView(id: 10, cardColor: .primary, isLabel: false, label: CustomLabel())
                    .allowsHitTesting(false)
            } else if cosmeticLabel == Label.moisturizer {
                AdvancedLotionView(id: 11, cardColor: .primary, isLabel: false, label: CustomLabel())
                    .allowsHitTesting(false)
            } else if cosmeticLabel == Label.sunProtect {
                Sunscreen(id: 12, cardColor: .primary, isLabel: false, label: CustomLabel())
                    .allowsHitTesting(false)
            } else if cosmeticLabel == Label.eyeCream {
                CreamView(id: 11, cardColor: .primary, isLabel: false, label: CustomLabel(), isEnter: false)
                    .scaleEffect(0.5)
                    .allowsHitTesting(false)
            } else if cosmeticLabel == Label.treatment {
                EssenceView(id: 11, cardColor: .primary, isLabel: false, label: CustomLabel())
                    .allowsHitTesting(false)
            } else if cosmeticLabel == Label.faceMask {
                MaskView()
            }
            
            
            if #available(iOS 16.1, *) {
                Text(cosmetic.brand)
                    .font(.title2)
                    .fontDesign(.serif)
                    .bold()
            } else {
                Text(cosmetic.brand)
                    .font(.title3)
                    .bold()
            }
            
            Text(cosmetic.name)
                .font(.title)

            HStack() {
                Text("Price")
                    .bold()
                Text(cosmetic.price.description)
            
                Spacer()
                
                Text("Rank")
                    .bold()
                Text(cosmetic.rank.description)
                
                Spacer()

                if (cosmetic.combination && cosmetic.dry && cosmetic.normal && cosmetic.oily && cosmetic.sensitive) {
                    Text("Applicable for all")
                        .bold()
                } else {
                    Text("Inapplicable for")
                        .bold()
                    SkinTypeViewSheet(cosmetic: cosmetic)
                }
                
                Spacer()

                HStack {
                    Text("Function")
                        .bold()
                    CosmeticFunctionView(cosmetic: cosmetic)
                }
            }


            
            Divider().background(Color.primary)

            Text("Ingredients")
                .bold()
            Text(cosmetic.ingredients.formatted())
        }
        .padding(30)
    }
}
