//
//  Sunscreen.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/24.
//

import SwiftUI
import SwiftData

class SunscreenPage: ProductViewAbstract {
    
    init() {
        super.init(id: 3, cardColor: Color(hex: 0x0077FF), isLabel: false, label: CustomLabel(text: "Sunscreen"), typicalIngredients: K.ingredSuncreen, bubbles: bubblesSunscreen, alertText: "Please tap the lid")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(Sunscreen(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, bubbles: bubbles))
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesSunscreen: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.3 * minimumIndex,
                     offset: CGSize(width: 0.200 * screenWidth, height: -0.030 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        Text("The objective of sun protection\nis to prevent the harm of ultraviolet(UV) rays.")
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                    )),
        
        SingleBubble(id: 2, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: 0.380 * screenWidth, height: 0.220 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        VStack(alignment: .leading, spacing: -20) {
                            HStack {
                                GeometryReader { geometry in
                                    Image(systemName: "arrow.left")
                                        .scaleEffect(x: 10, y: 1)
                                        .rotationEffect(Angle(degrees: -30))
                                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.64)
                                    
                                    Image(systemName: "arrow.left")
                                        .scaleEffect(x: 5, y: 1)
                                        .rotationEffect(Angle(degrees: -60))
                                        .position(x: geometry.size.width * 0.7, y: geometry.size.height * 0.64)
                                    
                                    Image(systemName: "sun.max.fill")
                                        .colorInvert()
                                        .scaleEffect(2)
                                        .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.3)

                                }
                            }
                            
                            
                            
                            Text("UV light consists of two main bands: UVA and UVB. UVA band (320 nm ~ 400 nm) primarily causes skin aging and roughness. UVB band (280 nm ~ 320 nm) is responsible for causing dryness, redness, and the risk of cancer. A high-quality sunscreen should provide protection against both of these bands, offering comprehensive protection.")
                                .fontWeight(.bold)
                                .padding(.bottom)
                            
                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.36 * minimumIndex,
                     offset: CGSize(width: -0.220 * screenWidth, height: 0.070 * screenHeight),
                     timeBeforeAppeared: 1.2,
                     label: AnyView(
                         Text("Chemical sunscreen ingredients such as oxybenzone (Benzophenone-3) and octinoxate (Ethylhexyl methoxycinnamate) have been a focus of concern due to their potential harm to marine ecosystems.")
                             .bold()                    
                         )),

        SingleBubble(id: 4, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: -0.360 * screenWidth, height: 0.360 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView( VStack{
                         Text("1.They are harmful to coral reefs and other marine organisms, and can contribute to coral bleaching and death, causing damage to marine ecosystems.")
                             .bold()
                         Text("2.The chemical components in sunscreen can accumulate in water and have toxic effects on aquatic organisms.")
                             .bold()
                     })),

        
        SingleBubble(id: 5, radius: 0.48 * minimumIndex,
                     offset: CGSize(width: -0.320 * screenWidth, height: 0.640 * screenHeight),
                     timeBeforeAppeared: 2.6,
                     label: AnyView( VStack {
                         Text("Some regions have started to ban the sale of sunscreens containing these chemical ingredients. For example, Hawaii banned all products containing oxybenzone and octinoxate starting from January 1, 2021. Additionally, France and Palau have also announced plans to ban these chemical ingredients.")
                             .bold()
                     })),
        
//        SingleBubble(id: 5, radius: 0.26 * minimumIndex,
//                     offset: CGSize(width: -0.200 * screenWidth, height: 0.700 * screenHeight),
//                     timeBeforeAppeared: 1.2,
//                     label: AnyView( VStack {
//                         Text("\"Nonionic\"")
//                             .font(.title2)
//                             .bold()
//                         Text("rarely used as the main surfactant, mainly used for antistatic, sterilization")
//                             .bold()
//                         
//                     }))
    ]

}

struct Sunscreen: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables
    
    var id: Int
    var cardColor: Color
    var isLabel: Bool
    var label: CustomLabel
    var bubbles: [SingleBubble] = []

    // MARK: inner UI parameters
    private let aspectRatio: CGFloat = 62 / 137
    private let aspectRatioNozzle: CGFloat = 13 / 29
    
    private let aspectRatioNozzleCircle: CGFloat = 3
    //    let aspectRatioNozzleRect: CGFloat = 13 / 18
    private let aspectRatioBody : CGFloat = 62 / 108
    private let aspectRatioCap : CGFloat = 19 / 31
    
    private let heightRatioTocalNozzle: CGFloat = 38 / 138
    private let heightRatioTocalBody: CGFloat = 100 / 138
    
    private let heightRatioNozzleTop: CGFloat = 13 / 30
    private let heightRatioNozzleBottom: CGFloat = 18 / 30
    
    private let widthRatioTotalNozzle: CGFloat = 13 / (62 + 19 + 13)
    private let widthRatioTotalCap: CGFloat = 19 / (62 + 19 + 13)
    
    private let paddingIndexNozzle: CGFloat = -0.12
    
    @State private var offset: CGSize = CGSize(width: 10, height: 10)
    @State private var isPressed = false
    
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                GeometryReader { geometry in
                    HStack {
                        Spacer()
                        
                        ZStack(alignment: .top) {
                            ParentView(description: "Static", childView:  {
                                VStack(spacing: 0) {
                                    // MARK: 嘴尖
                                    renderCapInner(geometrySize: geometry.size)
                                    
                                    // MARK: 瓶身
                                    renderBody(geometrySize: geometry.size)
                                }
                            })
                            .zIndex(1.0)
                            
                            // MARK: 嘴帽
                            renderCapOuter(geometrySize: geometry.size)
                                .zIndex(2.0)
                        }
                        .scaleEffect(0.7)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            .zIndex(2.0)
            
            if isPressed {
                renderBubble(geometrySize: .zero)
                    .zIndex(1.0)
            }
        }
        
    }
        
    func renderCapOuter(geometrySize: CGSize) -> some View {
        SingleCornerRoundedRectangle(cornerRadius: geometrySize.height * 0.01, corners: [.topLeft, .topRight])                        .fill(K.glassGradientLight.opacity(0.4).shadow(.inner(color: .primary, radius: geometrySize.width * 0.02)))
            .aspectRatio(aspectRatioCap, contentMode: .fit)
            .frame(height: geometrySize.height * heightRatioTocalNozzle)
            .padding(.leading, geometrySize.height * paddingIndexNozzle)
        //                                .allowsHitTesting(!isPressed)
            .offset(y: isPressed ? geometrySize.height * -0.3 : 0)
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
    
    func renderCapInner(geometrySize: CGSize) -> some View {
        VStack(spacing: geometrySize.height * -0.03) {
            ZStack(alignment: .bottom, content: {
                // 嘴上尖
                SunscreenNozzle()
                    .fill(colorScheme == .light ? K.glassGradientDark.shadow(.inner(color: .primary, radius: geometrySize.width * 0.003)) : K.glassGradientShadow.shadow(.inner(color: .primary, radius: geometrySize.width * 0.003)))
                
                // 嘴中圆
                Ellipse()
                    .fill(K.glassGradientLight.shadow(.inner(color: .primary, radius: geometrySize.width * 0.005)))
                    .aspectRatio(aspectRatioNozzleCircle, contentMode: .fit)
                    .padding(.bottom, geometrySize.height * 0.01)
            })
            
            //嘴底方
            Rectangle()
                .fill(K.glassGradientDark)
        }
        .aspectRatio(aspectRatioNozzle, contentMode: .fit)
        .frame(height: geometrySize.height * heightRatioTocalNozzle)
        .padding(.leading, geometrySize.height * paddingIndexNozzle)
    }

    func renderBody(geometrySize: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: geometrySize.height * 0.03)
                .fill(K.glassGradientDark.shadow(.inner(color: globalVariables.currentPrimaryColor, radius: geometrySize.width * 0.05)))
            if isLabel {
                GeometryReader { geometry in
                    HStack {
                        Spacer()
                        
                        Text(label.text)
                            .font(label.font)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundStyle(globalVariables.currentBGColor)
                            .padding(.vertical, geometry.size.width / 5)
                            .padding(.leading, geometry.size.width / 20)
                            .padding(.horizontal, 5)
                            .background(.blue)
                            .cornerRadius(geometry.size.width / 30)
                    }
                    .offset(y: geometry.size.height / 3)
                }
            }
        }
        .frame(height: geometrySize.height * heightRatioTocalBody)
        .aspectRatio(aspectRatioBody, contentMode: .fit)
    }
    
    func renderBubble(geometrySize: CGSize) -> some View {
        BubbleCanvas(description: "Child", isPressed: isPressed, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles) // x正右 y正下
    }
}

struct SunscreenNozzle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.57692*width, y: 0.3*height))
        path.addLine(to: CGPoint(x: 0.76923*width, y: 0.76667*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.86667*height), control1: CGPoint(x: 0.76923*width, y: 0.76667*height), control2: CGPoint(x: 0.69231*width, y: 0.86667*height))
        path.addCurve(to: CGPoint(x: 0.23077*width, y: 0.76667*height), control1: CGPoint(x: 0.30769*width, y: 0.86667*height), control2: CGPoint(x: 0.23077*width, y: 0.76667*height))
        path.addLine(to: CGPoint(x: 0.38462*width, y: 0.3*height))
        path.addLine(to: CGPoint(x: 0.38462*width, y: 0.06667*height))
        path.addLine(to: CGPoint(x: 0.57692*width, y: 0.06667*height))
        path.addLine(to: CGPoint(x: 0.57692*width, y: 0.3*height))
        path.closeSubpath()
        return path
    }
}
