//
//  LotionView.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/23.
//

import SwiftUI

class CleanserPage: ProductViewAbstract {
    
    init() {
        super.init(id: 1, cardColor: Color(hex: 0xc3ff00), isLabel: false, label: CustomLabel(text: "Cleanser"), typicalIngredients: K.ingredClean, bubbles: bubblesLandscapeIpad, alertText: "Please tap the nozzle")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(
            LotionView(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, bubbles: bubbles)
        )
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesLandscapeIpad: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.3 * minimumIndex,
                     offset: CGSize(width: 0.260 * screenWidth, height: 0.030 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        VStack {
                            Text("The basic ingredient category of facial cleanser")
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                            Text("\"Surfactant\"").font(.title).bold()
                        }
                    )),
        
        SingleBubble(id: 2, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: 0.360 * screenWidth, height: 0.520 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        VStack(alignment: .leading) {
                            Text("According to the positive or negative charge of their head groups and whether they have a charge, surfactants can be classified into three categories: Anionic(-), Zwitterionic(+&-), and Nonionic(null)")
                                .padding(.bottom, 10)
                            
                            Text("Cleaning strength & Irritability:")
                                .bold()
                            Text("Anionic > Zwitterionic = Nonionic")
//                            Spacer()
                            
                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.28 * minimumIndex,
                     offset: CGSize(width: -0.360 * screenWidth, height: 0.360 * screenHeight),
                     timeBeforeAppeared: 2.2,
                     label: AnyView(VStack {
                         Text("\"Anionic\"")
                             .font(.title2)
                             .bold()
                         Text("Strong foaming power, good cleansing effects, with relatively lower costs.")
                     })),
        
        SingleBubble(id: 4, radius: 0.35 * minimumIndex,
                     offset: CGSize(width: -0.380 * screenWidth, height: 0.580 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView( VStack {
                         Text("\"Zwitterionic\"")
                             .font(.title2)
                             .bold()
                         Text("The foaming force is generally weak, but the irritation is very low, the elution capacity is medium,\nand it is often combined with other surface activities.")
//                             .multilineTextAlignment(.trailing)
                     })),
        
        SingleBubble(id: 5, radius: 0.32 * minimumIndex,
                     offset: CGSize(width: -0.200 * screenWidth, height: 0.680 * screenHeight),
                     timeBeforeAppeared: 1.2,
                     label: AnyView( VStack {
                         Text("\"Nonionic\"")
                             .font(.title2)
                             .bold()
                         Text(K.ingredClean[4].function)
                         
                     }))
    ]

}

struct LotionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables
    
    var id: Int
    var cardColor: Color
    var isLabel: Bool = false
    var label: CustomLabel
    var bubbles: [SingleBubble] = []
//    private let aspectRatio: CGFloat = 57 / 125.5
//    private let heightRatioNozzle: CGFloat = 14.5 / 125.5
//    private let widthRatioCap: CGFloat = 23 / 57
//    private let widthRatioNozzleAndBody: CGFloat = 57 / 57
//    private let widthRatioCap: CGFloat = 23 / 137
//    private let widthRatioNozzleAndBody: CGFloat = 57 / 137
    
    @State private var offsetY: CGFloat = 0
    @State private var isPressed = false
    

    
    // 用geometry比例，width正右 height正下
//    var bubblesPortraitIpad: [SingleBubble] = [
//        SingleBubble(id: 1, radius: 0.7 * minimumIndex,
//                     offset: CGSize(width: -0.380 * screenWidthIndex, height: 0.500 * screenHeightIndex),
//                     timeBeforeAppeared: 1.2,
//                     label: CustomLabel(text: "B1")),
//        
//        SingleBubble(id: 2, radius: 0.3 * minimumIndex,
//                     offset: CGSize(width: 0.200 * screenWidthIndex, height: -0.030 * screenHeightIndex),
//                     timeBeforeAppeared: 0.8,
//                     label: CustomLabel(text: "B2", font: .system(size: 64).bold())),
//        
//        SingleBubble(id: 3, radius: 0.4 * minimumIndex,
//                     offset: CGSize(width: 0.380 * screenWidthIndex, height: 0.220 * screenHeightIndex),
//                     timeBeforeAppeared: 0.7,
//                     label: CustomLabel(text: "That's the topic\nwhat I was looking for\nthese days.\nI really appreciate\nyour work!\nThanks"))
//    ]


    var body: some View {
        ZStack(alignment: .topLeading) {
//            if globalVariables.isEnterProductViewAbstract {
//                Text("Cleanser")
//                    .font(.largeTitle.bold())
//                    .minimumScaleFactor(0.1)
//                    .padding(10)
//            } else {
//                Text("Cleanser")
//                    .font(.largeTitle.bold())
//                    .minimumScaleFactor(0.1)
//                    .padding(10)
//            }
//
            GeometryReader { geometry in
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: globalVariables.isPortrait ? geometry.size.width * -0.01 : geometry.size.height * -0.005) {
                        Spacer()
                        
                        renderNozzle(geometrySize: geometry.size)
                        
                        VStack(spacing: globalVariables.isPortrait ? geometry.size.height * -0.01 : geometry.size.height * -0.001) {
                            renderCap(geometrySize: geometry.size)
                            
                            renderBody(geometrySize: geometry.size)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
                .scaleEffect(0.7)
                .zIndex(2.0)
                    
                    
                if isPressed {
                    renderBubble(geometrySize: geometry.size)
                        .zIndex(1.0)
                }
            
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    private func renderNozzle(geometrySize: CGSize) -> some View {
        let aspectRatioNozzle: CGFloat = 54 / 14.5

        return ParentView(description: "Nozzle") {
            LotionNozzle()
                .fill(K.glassGradientDark)
                .aspectRatio(aspectRatioNozzle, contentMode: .fit)
        }
        .offset(y: isPressed ? geometrySize.height * 0.03 : 0)
        .onTapGesture {
            withAnimation {
                isPressed.toggle()
            }
            
            Timer.scheduledTimer(withTimeInterval: 500, repeats: false) { _ in
                withAnimation {
                    isPressed = false
                }
            }
        }
    }
    
    private func renderCap(geometrySize: CGSize) -> some View {
        let aspectRatioCap: CGFloat = 23 / 15
        let heightRatioCap: CGFloat = 15 / 125.5

        return ParentView(description: "Cap") {
            Rectangle()
                .fill(K.glassGradientDark.shadow(.inner(radius: 50)))
                .cornerRadius(4)
                .aspectRatio(aspectRatioCap, contentMode: .fit)
                .frame(height: geometrySize.height * heightRatioCap)
        }
    }
    
    private func renderBody(geometrySize: CGSize) -> some View {
        let aspectRatioBody: CGFloat = 57 / 96
        let heightRatioBody: CGFloat = 96 / 125.5

        return ParentView(description: "Body") {
            ZStack {
                Rectangle()
                    .fill(K.glassGradientShadow.opacity(colorScheme == .dark ? 0.9 : 0.3))
                    .cornerRadius(8)
                    .zIndex(1.0)
                    .overlay {
                        if isLabel {
                            HStack {
                                Spacer()
                                Text(label.text)
                                // MARK: font
                                    .font(label.font)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                    .foregroundStyle(globalVariables.currentBGColor)
                                // MARK: padding
                                    .padding(.vertical, globalVariables.isPortrait ? geometrySize.width * 0.07 : geometrySize.height * 0.06)
                                    .padding(.leading, geometrySize.height * 0.05) // 左向伸长
                                    .padding(.horizontal, globalVariables.isPortrait ? geometrySize.width * 0.01 : geometrySize.height * 0.01)
                                // MARK: background
                                    .background(.regularMaterial)
                                    .cornerRadius(globalVariables.isPortrait ? geometrySize.width * 0.01 : geometrySize.height * 0.01)
                                //                                .offset(x: geometrySize.width * 0.05, y: 0) // Move right & down
                            }
                            .zIndex(2.0)
                        }
                    }
            }
            .aspectRatio(aspectRatioBody, contentMode: .fit)
            .frame(height: geometrySize.height * heightRatioBody)
            
        }

    }
    
    private func renderBubble(geometrySize: CGSize) ->  some View {
//        var currentBubble: [SingleBubble] = globalVariables.isPortrait ? bubblesPortraitIpad : bubblesLandscapeIpad
        return BubbleCanvas(description: "Child", isPressed: isPressed, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles) // x正右 y正下
        
    }
    
}

struct LotionNozzle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.59649*width, y: 0.96667*height))
        path.addLine(to: CGPoint(x: 0.37719*width, y: 0.96667*height))
        path.addLine(to: CGPoint(x: 0.37719*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.31579*width, y: 0.26667*height), control1: CGPoint(x: 0.37719*width, y: 0.5*height), control2: CGPoint(x: 0.31579*width, y: 0.46667*height))
        path.addCurve(to: CGPoint(x: 0.37719*width, y: 0.03334*height), control1: CGPoint(x: 0.31579*width, y: 0.07288*height), control2: CGPoint(x: 0.37719*width, y: 0.03334*height))
        path.addLine(to: CGPoint(x: 0.89474*width, y: 0.03334*height))
        path.addLine(to: CGPoint(x: 0.89474*width, y: 0.43334*height))
        path.addLine(to: CGPoint(x: 0.59649*width, y: 0.43334*height))
        path.addLine(to: CGPoint(x: 0.59649*width, y: 0.96667*height))
        path.closeSubpath()
        return path
    }
}
