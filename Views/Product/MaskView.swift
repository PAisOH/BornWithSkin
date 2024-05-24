//
//  File.swift
//  
//
//  Created by Euan on 2024/2/20.
//

import SwiftUI

class RepairMaskPage: ProductViewAbstract {
    
    
    init() {
        super.init(id: 6, cardColor: Color(hex: 0xACB3B7), isLabel: false, label: CustomLabel(text: "Repair Mask"), typicalIngredients: K.ingredRepair, bubbles: bubblesRepair, alertText: "Please press mask")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(MaskView(bubbles: bubbles))
    }

    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesRepair: [SingleBubble] = [
        
        SingleBubble(id: 1, radius: 0.32 * minimumIndex,
                     offset: CGSize(width: 0.360 * screenWidth, height: 0.380 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        Text("Repair")
                            .bold()
                            .font(.system(size: 28, weight: .bold, design: .serif))
                        +
                        Text("itself is a very comprehensive topic. \nMoisturizing, sun protection, anti-aging, and other functional ingredients can also achieve certain repair effects.")
                     )),
        
        SingleBubble(id: 2, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: 0.150 * screenWidth, height: 0.640 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                         Text("However, when it comes to sensitive skin, special attention needs to be paid to the topic of repair. Due to seasonal changes, dust exposure, and other factors, sensitive skin is more prone to issues such as flaking and redness compared to other skin types, which requires soothing and repairing ingredients.")
                             .bold()
                             .padding(.bottom)
                     
                       )),
        
        
        SingleBubble(id: 3, radius: 0.6 * minimumIndex,
                     offset: CGSize(width: -0.320 * screenWidth, height: 0.600 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView(VStack {
                         VStack(alignment: .leading, spacing: 0) {
                             ForEach(K.ingredRepair) { ingredient in
                                 Text(ingredient.name)
                                     .font(.title3)
                                     .bold()
                                 //                                     .frame(width: 0.7 * minimumIndex * 0.7)
                                 Text("\"" + ingredient.function + "\"")
//                                     .bold()
//                                 Text(ingredient.description)
                                 //                                     .bold()
                                 Divider()
                             }
                         }
                         .padding(.all, 20)
                         .padding(.horizontal, 10)
                     }))
    ]
}


struct MaskView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables

    @State var isTap: Bool = false
    
    var bubbles: [SingleBubble] = []
    
    init() {
        
    }
    
    init(bubbles: [SingleBubble]) {
        self.bubbles = bubbles
    }

    private var aspectRatio: CGFloat = 108 / 122
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                ZStack {
                    ParentView(description: "Mask") {
                        Mask()
                            .fill(K.glassGradientShadow.opacity(colorScheme == .light ? 0.3 : 0.7).shadow(.inner(color: colorScheme == .light ? .black : .white, radius: 50)))
                    }
                    .zIndex(1.0)
                    
                    MaskShade().fill(colorScheme == .light ?  .white : .black)
                        .zIndex(2.0)
                }
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(30)
                .onTapGesture {
                    withAnimation() {
                        isTap.toggle()
                    }
                }
                
                Spacer()
            }
            .allowsHitTesting(globalVariables.isEnterProductViewAbstract ? true : false)
            
            if isTap {
                BubbleCanvas(description: "Child", isPressed: isTap, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles)
            }
        }
    }
}

struct Mask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.50047*width, y: 0.00806*height))
        path.addCurve(to: CGPoint(x: 0.04925*width, y: 0.2659*height), control1: CGPoint(x: 0.2286*width, y: 0.00806*height), control2: CGPoint(x: 0.09877*width, y: 0.15031*height))
        path.addCurve(to: CGPoint(x: 0.00909*width, y: 0.45061*height), control1: CGPoint(x: 0.02679*width, y: 0.31834*height), control2: CGPoint(x: 0.01294*width, y: 0.38963*height))
        path.addCurve(to: CGPoint(x: 0.18799*width, y: 0.45061*height), control1: CGPoint(x: 0.00868*width, y: 0.45718*height), control2: CGPoint(x: 0.18799*width, y: 0.45061*height))
        path.addCurve(to: CGPoint(x: 0.00909*width, y: 0.47827*height), control1: CGPoint(x: 0.18799*width, y: 0.45061*height), control2: CGPoint(x: 0.00907*width, y: 0.47167*height))
        path.addCurve(to: CGPoint(x: 0.11215*width, y: 0.80227*height), control1: CGPoint(x: 0.00955*width, y: 0.61656*height), control2: CGPoint(x: 0.03632*width, y: 0.70744*height))
        path.addCurve(to: CGPoint(x: 0.26828*width, y: 0.7193*height), control1: CGPoint(x: 0.12112*width, y: 0.81348*height), control2: CGPoint(x: 0.26828*width, y: 0.7193*height))
        path.addCurve(to: CGPoint(x: 0.13892*width, y: 0.82994*height), control1: CGPoint(x: 0.26828*width, y: 0.7193*height), control2: CGPoint(x: 0.12874*width, y: 0.81843*height))
        path.addCurve(to: CGPoint(x: 0.50047*width, y: 0.99194*height), control1: CGPoint(x: 0.23806*width, y: 0.94201*height), control2: CGPoint(x: 0.37128*width, y: 0.99194*height))
        path.addCurve(to: CGPoint(x: 0.87493*width, y: 0.82994*height), control1: CGPoint(x: 0.63053*width, y: 0.99194*height), control2: CGPoint(x: 0.78123*width, y: 0.94229*height))
        path.addCurve(to: CGPoint(x: 0.75003*width, y: 0.7193*height), control1: CGPoint(x: 0.88452*width, y: 0.81843*height), control2: CGPoint(x: 0.75003*width, y: 0.7193*height))
        path.addCurve(to: CGPoint(x: 0.9017*width, y: 0.80227*height), control1: CGPoint(x: 0.75003*width, y: 0.7193*height), control2: CGPoint(x: 0.89464*width, y: 0.8144*height))
        path.addCurve(to: CGPoint(x: 0.99091*width, y: 0.47827*height), control1: CGPoint(x: 0.95*width, y: 0.7193*height), control2: CGPoint(x: 0.99091*width, y: 0.62051*height))
        path.addCurve(to: CGPoint(x: 0.83032*width, y: 0.45061*height), control1: CGPoint(x: 0.99106*width, y: 0.47168*height), control2: CGPoint(x: 0.83032*width, y: 0.45061*height))
        path.addCurve(to: CGPoint(x: 0.99091*width, y: 0.45061*height), control1: CGPoint(x: 0.83032*width, y: 0.45061*height), control2: CGPoint(x: 0.99118*width, y: 0.45718*height))
        path.addCurve(to: CGPoint(x: 0.95076*width, y: 0.2649*height), control1: CGPoint(x: 0.98875*width, y: 0.39924*height), control2: CGPoint(x: 0.98314*width, y: 0.34787*height))
        path.addCurve(to: CGPoint(x: 0.50047*width, y: 0.00806*height), control1: CGPoint(x: 0.91645*width, y: 0.17696*height), control2: CGPoint(x: 0.77234*width, y: 0.00806*height))
        path.closeSubpath()
        return path
    }
}


struct MaskShade: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.41798*width, y: 0.34293*height))
        path.addCurve(to: CGPoint(x: 0.16415*width, y: 0.34293*height), control1: CGPoint(x: 0.41798*width, y: 0.28709*height), control2: CGPoint(x: 0.14935*width, y: 0.29038*height))
        path.addCurve(to: CGPoint(x: 0.27375*width, y: 0.39897*height), control1: CGPoint(x: 0.17548*width, y: 0.38317*height), control2: CGPoint(x: 0.2171*width, y: 0.3998*height))
        path.addCurve(to: CGPoint(x: 0.41798*width, y: 0.34293*height), control1: CGPoint(x: 0.32903*width, y: 0.39817*height), control2: CGPoint(x: 0.41798*width, y: 0.38301*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.58154*width, y: 0.34293*height))
        path.addCurve(to: CGPoint(x: 0.83538*width, y: 0.34293*height), control1: CGPoint(x: 0.58154*width, y: 0.28709*height), control2: CGPoint(x: 0.85017*width, y: 0.29038*height))
        path.addCurve(to: CGPoint(x: 0.72577*width, y: 0.39897*height), control1: CGPoint(x: 0.82405*width, y: 0.38317*height), control2: CGPoint(x: 0.78242*width, y: 0.3998*height))
        path.addCurve(to: CGPoint(x: 0.58154*width, y: 0.34293*height), control1: CGPoint(x: 0.67049*width, y: 0.39817*height), control2: CGPoint(x: 0.58154*width, y: 0.38301*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.63143*width, y: 0.7174*height))
        path.addCurve(to: CGPoint(x: 0.59578*width, y: 0.75425*height), control1: CGPoint(x: 0.63143*width, y: 0.73427*height), control2: CGPoint(x: 0.61877*width, y: 0.74627*height))
        path.addCurve(to: CGPoint(x: 0.5043*width, y: 0.7657*height), control1: CGPoint(x: 0.57274*width, y: 0.76225*height), control2: CGPoint(x: 0.54048*width, y: 0.7657*height))
        path.addCurve(to: CGPoint(x: 0.41283*width, y: 0.75425*height), control1: CGPoint(x: 0.46813*width, y: 0.7657*height), control2: CGPoint(x: 0.43587*width, y: 0.76225*height))
        path.addCurve(to: CGPoint(x: 0.37718*width, y: 0.7174*height), control1: CGPoint(x: 0.38984*width, y: 0.74627*height), control2: CGPoint(x: 0.37718*width, y: 0.73427*height))
        path.addCurve(to: CGPoint(x: 0.41283*width, y: 0.68055*height), control1: CGPoint(x: 0.37718*width, y: 0.70053*height), control2: CGPoint(x: 0.38984*width, y: 0.68853*height))
        path.addCurve(to: CGPoint(x: 0.5043*width, y: 0.6691*height), control1: CGPoint(x: 0.43587*width, y: 0.67255*height), control2: CGPoint(x: 0.46813*width, y: 0.6691*height))
        path.addCurve(to: CGPoint(x: 0.59578*width, y: 0.68055*height), control1: CGPoint(x: 0.54048*width, y: 0.6691*height), control2: CGPoint(x: 0.57274*width, y: 0.67255*height))
        path.addCurve(to: CGPoint(x: 0.63143*width, y: 0.7174*height), control1: CGPoint(x: 0.61877*width, y: 0.68853*height), control2: CGPoint(x: 0.63143*width, y: 0.70053*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.41606*width, y: 0.54827*height))
        path.addCurve(to: CGPoint(x: 0.42708*width, y: 0.49573*height), control1: CGPoint(x: 0.395*width, y: 0.52887*height), control2: CGPoint(x: 0.42708*width, y: 0.49573*height))
        path.addCurve(to: CGPoint(x: 0.42708*width, y: 0.53826*height), control1: CGPoint(x: 0.42708*width, y: 0.49573*height), control2: CGPoint(x: 0.40461*width, y: 0.52501*height))
        path.addCurve(to: CGPoint(x: 0.50419*width, y: 0.55327*height), control1: CGPoint(x: 0.44619*width, y: 0.54953*height), control2: CGPoint(x: 0.47287*width, y: 0.55327*height))
        path.addCurve(to: CGPoint(x: 0.57028*width, y: 0.53826*height), control1: CGPoint(x: 0.54274*width, y: 0.55327*height), control2: CGPoint(x: 0.55927*width, y: 0.54576*height))
        path.addCurve(to: CGPoint(x: 0.57028*width, y: 0.49573*height), control1: CGPoint(x: 0.59057*width, y: 0.52444*height), control2: CGPoint(x: 0.57028*width, y: 0.49573*height))
        path.addCurve(to: CGPoint(x: 0.58681*width, y: 0.54827*height), control1: CGPoint(x: 0.57028*width, y: 0.49573*height), control2: CGPoint(x: 0.60757*width, y: 0.5294*height))
        path.addCurve(to: CGPoint(x: 0.50419*width, y: 0.56828*height), control1: CGPoint(x: 0.57028*width, y: 0.56327*height), control2: CGPoint(x: 0.54274*width, y: 0.56828*height))
        path.addCurve(to: CGPoint(x: 0.41606*width, y: 0.54827*height), control1: CGPoint(x: 0.48216*width, y: 0.56828*height), control2: CGPoint(x: 0.43568*width, y: 0.56633*height))
        path.closeSubpath()
        return path
    }
}
