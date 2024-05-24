//
//  AdvancedLotionView.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/23.
//

import SwiftUI

class MoisturizerPage: ProductViewAbstract {
    
    init() {
        super.init(id: 2, cardColor: Color(hex: 0x90a4ff), isLabel: true, label: CustomLabel(text: "Moisturizer"), typicalIngredients: K.ingredMoist, bubbles: bubblesMoist, alertText: "Please tap the nozzle")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(AdvancedLotionView(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, bubbles: bubbles))
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesMoist: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.32 * minimumIndex,
                     offset: CGSize(width: 0.280 * screenWidth, height: 0.300 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        VStack {
                            Text("Moisturizing\n")
                                .bold()
                                .font(.system(size: 28, weight: .bold, design: .serif))
                            +
                            Text("is the fundamental of skincare.")
//                                .bold()
                                .font(.title2)
//                                .multilineTextAlignment(.center)
                        }
                     )),
        
        SingleBubble(id: 2, radius: 0.3 * minimumIndex,
                     offset: CGSize(width: 0.380 * screenWidth, height: 0.500 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        VStack(alignment: .leading) {
                            Text("Almost all categories of skincare products have moisturizing effects, which form the basis for acne treatment, repairing, brightening, and anti-aging.")
//                                .fontWeight(.bold)
                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.6 * minimumIndex,
                     offset: CGSize(width: -0.260 * screenWidth, height: 0.580 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView(VStack(alignment: .leading) {
                         Text("Humectants")
                             .bold()
                             .font(.title3)
                         Text("Humectants are ingredients that can absorb moisture and maintain skin hydration. They help increase the water content of the skin.")
                         Divider()
                         Text("Occlusives")
                             .bold()
                             .font(.title3)
                         Text("Occlusives are ingredients that can form a protective barrier, sealing in moisture and preventing water loss from the skin. They help maintain the skin's moisture balance and protect it from external irritants.")
                         Divider()
                         Text("Emollients")
                             .bold()
                             .font(.title3)
                         Text("Emollients are ingredients that can moisturize and soften the skin, helping to improve its texture and radiance. They provide hydration and soothing effects, making the skin feel softer and smoother.")
                         //                         VStack(alignment: .leading, spacing: 0) {
                         //                             ForEach(K.ingredMoist) { ingredient in
                         //                                 Text(ingredient.name)
                         //                                     .font(.title3)
                         //                                     .bold()
                         ////                                     .frame(width: 0.7 * minimumIndex * 0.7)
                         //                                 Text("\"" + ingredient.function + "\"")
                         //                                     .bold()
                         //                                 Text(ingredient.description)
                         ////                                     .bold()
                         //                                 Divider()
                         //                             }
                         //                         }
                         //                             .padding(.all, 20)
                         //                             .padding(.horizontal, 10)
                     }
                        .padding(.horizontal, 50)
                                   ))
    ]
}

struct AdvancedLotionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables
    
    var id: Int
    var cardColor: Color
    var isLabel: Bool
    var label: CustomLabel
    var bubbles: [SingleBubble] = []
    
    let aspectRatio: CGFloat = 46 / 116
    let aspectRationNozzle: CGFloat = 46 / 12.5
    
    let heightRatioNozzle: CGFloat = 12.5 / 117.5
    let heightRatioCap: CGFloat = 27.5 / 117.5
    let heightRatioBody: CGFloat = 77.5 / 117.5
    
    @State private var offsetY: CGFloat = 0
    @State private var isPressed = false
    
    @State var childPosition: CGPoint = .zero
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    
                    VStack(spacing: -0.03 * geometry.size.height) {
                        Spacer()
                        
                        ParentView(description: "高级润肤乳Dynamic") {
                            AdvancedLotionNozzle()
                                .fill(K.glassGradientDark.shadow(.inner(color: .primary, radius: 20)))
                                .aspectRatio(aspectRationNozzle, contentMode: .fit)
                                .frame(height: geometry.size.height * heightRatioNozzle)
                        }
//                        .allowsHitTesting(isAnimated)
                        .offset(y: isPressed ? geometry.size.height * 0.03 : 0)
                        .onTapGesture { gesture in
                            childPosition = CGPoint(x: gesture.x, y: gesture.y)
                            withAnimation {
                                isPressed.toggle()
                            }
                            Timer.scheduledTimer(withTimeInterval: 500, repeats: false) { _ in
                                withAnimation {
                                    isPressed = false
                                }
                            }
                        }
                        
                        ParentView(description: "高级润肤乳Static") {
                            VStack(spacing: -0.03 * geometry.size.height) {
                                
                                AdvancedLotionCap()
                                    .fill(K.glassGradientLight.shadow(.inner(color: .primary, radius: 20)))
                                    .frame(height: geometry.size.height * heightRatioCap)
                                
                                AdvancedLotionBody()
                                    .fill(K.glassGradientLight.shadow(.inner(color: .primary, radius: 50, x: 30, y: 20)))
                                    .frame(height: geometry.size.height * heightRatioBody)
                                
                            }
                        }
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            .scaleEffect(0.7)
            .zIndex(2.0)
            
            if isPressed {
                BubbleCanvas(description: "Child", isPressed: isPressed, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles) // x正右 y正下
//                    .offset(CGSize(width: 200.0, height: -300.0)) // 起始点 移动回按帽的位置
                    .zIndex(1.0)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AdvancedLotionNozzle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.71739*width, y: 0.9*height))
        path.addCurve(to: CGPoint(x: 0.71739*width, y: 0.53812*height), control1: CGPoint(x: 0.71739*width, y: 0.9*height), control2: CGPoint(x: 0.71118*width, y: 0.67819*height))
        path.addCurve(to: CGPoint(x: 0.75*width, y: 0.27493*height), control1: CGPoint(x: 0.72053*width, y: 0.46729*height), control2: CGPoint(x: 0.72826*width, y: 0.37362*height))
        path.addCurve(to: CGPoint(x: 0.75*width, y: 0.07754*height), control1: CGPoint(x: 0.75*width, y: 0.27493*height), control2: CGPoint(x: 0.78165*width, y: 0.11698*height))
        path.addCurve(to: CGPoint(x: 0.65217*width, y: 0.07754*height), control1: CGPoint(x: 0.73037*width, y: 0.05308*height), control2: CGPoint(x: 0.65217*width, y: 0.07754*height))
        path.addLine(to: CGPoint(x: 0.52174*width, y: 0.14333*height))
        path.addCurve(to: CGPoint(x: 0.40217*width, y: 0.24203*height), control1: CGPoint(x: 0.47158*width, y: 0.17544*height), control2: CGPoint(x: 0.44018*width, y: 0.18454*height))
        path.addCurve(to: CGPoint(x: 0.35869*width, y: 0.37363*height), control1: CGPoint(x: 0.38232*width, y: 0.27206*height), control2: CGPoint(x: 0.36956*width, y: 0.31469*height))
        path.addCurve(to: CGPoint(x: 0.34782*width, y: 0.50522*height), control1: CGPoint(x: 0.34783*width, y: 0.43256*height), control2: CGPoint(x: 0.34782*width, y: 0.50522*height))
        path.addLine(to: CGPoint(x: 0.34782*width, y: 0.9*height))
        path.addCurve(to: CGPoint(x: 0.53261*width, y: 0.8342*height), control1: CGPoint(x: 0.34782*width, y: 0.9*height), control2: CGPoint(x: 0.45995*width, y: 0.8342*height))
        path.addCurve(to: CGPoint(x: 0.71739*width, y: 0.9*height), control1: CGPoint(x: 0.60527*width, y: 0.8342*height), control2: CGPoint(x: 0.71739*width, y: 0.9*height))
        path.closeSubpath()
        return path
    }
}

struct AdvancedLotionCap: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.21739*width, y: 0.95*height))
        path.addLine(to: CGPoint(x: 0.21739*width, y: 0.21667*height))
        path.addCurve(to: CGPoint(x: 0.25*width, y: 0.13334*height), control1: CGPoint(x: 0.21739*width, y: 0.21667*height), control2: CGPoint(x: 0.23093*width, y: 0.15753*height))
        path.addCurve(to: CGPoint(x: 0.33696*width, y: 0.06667*height), control1: CGPoint(x: 0.27069*width, y: 0.1071*height), control2: CGPoint(x: 0.33696*width, y: 0.06667*height))
        path.addCurve(to: CGPoint(x: 0.52174*width, y: 0.03333*height), control1: CGPoint(x: 0.33696*width, y: 0.06667*height), control2: CGPoint(x: 0.43169*width, y: 0.03312*height))
        path.addCurve(to: CGPoint(x: 0.70652*width, y: 0.06667*height), control1: CGPoint(x: 0.5944*width, y: 0.0335*height), control2: CGPoint(x: 0.70652*width, y: 0.06667*height))
        path.addCurve(to: CGPoint(x: 0.79348*width, y: 0.13333*height), control1: CGPoint(x: 0.70652*width, y: 0.06667*height), control2: CGPoint(x: 0.77279*width, y: 0.1071*height))
        path.addCurve(to: CGPoint(x: 0.82609*width, y: 0.2*height), control1: CGPoint(x: 0.81255*width, y: 0.15752*height), control2: CGPoint(x: 0.82609*width, y: 0.2*height))
        path.addLine(to: CGPoint(x: 0.82609*width, y: 0.95*height))
        path.addCurve(to: CGPoint(x: 0.52174*width, y: 0.9*height), control1: CGPoint(x: 0.82609*width, y: 0.95*height), control2: CGPoint(x: 0.6424*width, y: 0.90635*height))
        path.addCurve(to: CGPoint(x: 0.21739*width, y: 0.95*height), control1: CGPoint(x: 0.40227*width, y: 0.89372*height), control2: CGPoint(x: 0.21739*width, y: 0.95*height))
        path.closeSubpath()
        return path
    }
}

struct AdvancedLotionBody: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09375*width, y: 0.05696*height))
        path.addCurve(to: CGPoint(x: 0.02083*width, y: 0.13291*height), control1: CGPoint(x: 0.03125*width, y: 0.08228*height), control2: CGPoint(x: 0.02083*width, y: 0.13291*height))
        path.addLine(to: CGPoint(x: 0.02083*width, y: 0.92405*height))
        path.addCurve(to: CGPoint(x: 0.04167*width, y: 0.96835*height), control1: CGPoint(x: 0.02083*width, y: 0.92405*height), control2: CGPoint(x: 0.02235*width, y: 0.95472*height))
        path.addCurve(to: CGPoint(x: 0.10417*width, y: 0.98734*height), control1: CGPoint(x: 0.05947*width, y: 0.98092*height), control2: CGPoint(x: 0.10417*width, y: 0.98734*height))
        path.addLine(to: CGPoint(x: 0.89583*width, y: 0.98734*height))
        path.addCurve(to: CGPoint(x: 0.95833*width, y: 0.96835*height), control1: CGPoint(x: 0.89583*width, y: 0.98734*height), control2: CGPoint(x: 0.94027*width, y: 0.98078*height))
        path.addCurve(to: CGPoint(x: 0.97917*width, y: 0.91772*height), control1: CGPoint(x: 0.98054*width, y: 0.95308*height), control2: CGPoint(x: 0.97917*width, y: 0.91772*height))
        path.addLine(to: CGPoint(x: 0.97917*width, y: 0.12025*height))
        path.addCurve(to: CGPoint(x: 0.92708*width, y: 0.05696*height), control1: CGPoint(x: 0.97917*width, y: 0.12025*height), control2: CGPoint(x: 0.96146*width, y: 0.07346*height))
        path.addCurve(to: CGPoint(x: 0.82292*width, y: 0.02532*height), control1: CGPoint(x: 0.8927*width, y: 0.04046*height), control2: CGPoint(x: 0.82292*width, y: 0.02532*height))
        path.addCurve(to: CGPoint(x: 0.51042*width, y: 0.00633*height), control1: CGPoint(x: 0.82292*width, y: 0.02532*height), control2: CGPoint(x: 0.63305*width, y: 0.0052*height))
        path.addCurve(to: CGPoint(x: 0.23958*width, y: 0.02532*height), control1: CGPoint(x: 0.40396*width, y: 0.00731*height), control2: CGPoint(x: 0.23958*width, y: 0.02532*height))
        path.addCurve(to: CGPoint(x: 0.09375*width, y: 0.05696*height), control1: CGPoint(x: 0.23958*width, y: 0.02532*height), control2: CGPoint(x: 0.15625*width, y: 0.03165*height))
        path.closeSubpath()
        return path
    }
}

