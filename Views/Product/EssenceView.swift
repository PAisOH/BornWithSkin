//
//  EssenceView.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/23.
//

import SwiftUI

class AcneSerumPage: ProductViewAbstract {
    init() {
        super.init(id: 4, cardColor: .red, isLabel: false, label: CustomLabel(text: "Acne Serum"), typicalIngredients: K.ingredAcne, bubbles: bubblesAcne, alertText: "Please press long and pull out the dropper")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(EssenceView(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, bubbles: bubbles))
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesAcne: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: 0.200 * screenWidth, height: 0.07 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        Text("Acne is a common chronic inflammatory skin condition, and the primary underlying cause is abnormal keratinization of the follicular infundibulum under genetic influence (excessive production of sticky keratinocytes that cannot shed properly, leading to the eventual blockage of the follicular opening).")
                            .bold()
                        //                                .font(.title3)
                     )),
        
        SingleBubble(id: 2, radius: 0.38 * minimumIndex,
                     offset: CGSize(width: 0.360 * screenWidth, height: 0.380 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        GeometryReader { geometry in
                            VStack(alignment: .center, spacing: 0) {
                                
                                Text("Classifacation")
                                    .bold()
                                    .font(.title2)
                                    .padding(.bottom)
                                Divider()
                                
                                HStack {
                                    VStack {
                                        Text("Non-inflammatory")
                                            .bold()
                                    }
                                    .frame(width: geometry.size.width * 0.6)
                                    
                                    Divider()
                                    VStack {
                                        Text("Inflammatory")
                                            .bold()
                                    }
                                    .frame(width: geometry.size.width * 0.4)
                                }
                                .frame(height: geometry.size.height * 0.1)
                                
                                Divider()
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Open comedones\n    (blackheads),")
                                            .lineLimit(2)
                                        Text("closed comedones\n    (whiteheads,\nclosed comedones,\nmicrocomedones).")
                                    }
                                    .frame(width: geometry.size.width * 0.6)
                                    
                                    Divider()
                                    
                                    VStack(alignment: .leading) {
                                        Text("Papules,\npustules,\nnodules,\ncysts.")
                                    }
                                    .frame(width: geometry.size.width * 0.4)
                                }
                                .frame(height: geometry.size.height * 0.4)
                                
                                Divider()
                                
                                Text("Skin lesions: Refers to the skin changes caused by acne.")
                                    .fontWeight(.bold)
                                    .padding(.vertical, 20)
                            }
                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.36 * minimumIndex,
                     offset: CGSize(width: 0.150 * screenWidth, height: 0.640 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(VStack(spacing: 0) {
                         Text("Home remedies for acne are only suitable for mild, sporadic, and localized acne. For more frequent and severe acne, please seek help from a professional dermatologist.")
                             .bold()
                             .padding(.bottom)
                         Image(systemName: "exclamationmark.triangle")
                             .scaleEffect(2)
                         //                             .padding(.top)
                     }
                                   )),
        
        
        SingleBubble(id: 4, radius: 0.6 * minimumIndex,
                     offset: CGSize(width: -0.320 * screenWidth, height: 0.600 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView(VStack {
                         VStack(alignment: .leading, spacing: 0) {
                             ForEach(K.ingredAcne) { ingredient in
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

class GlowSerumPage: ProductViewAbstract {
    init() {
        super.init(id: 5, cardColor: .yellow, isLabel: false, label: CustomLabel(text: "Glow Serum"), typicalIngredients: K.ingredGlow, bubbles: bubblesGlow, alertText: "Please press long and pull out the dropper")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(EssenceView(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, bubbles: bubbles))
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesGlow: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.3 * minimumIndex,
                     offset: CGSize(width: 0.200 * screenWidth, height: -0.030 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        Text("Uneven skin tone and dullness are mainly caused by uneven melanin production in different areas of the face.")
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                    )),
        
        SingleBubble(id: 2, radius: 0.38 * minimumIndex,
                     offset: CGSize(width: 0.380 * screenWidth, height: 0.380 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        VStack(alignment: .leading) {
                            Text("1.Inhibition of tyrosinase activity: Tyrosinase is a key enzyme in melanin production. It converts tyrosine into dopa, which further leads to melanin synthesis. Inhibiting tyrosinase activity can reduce melanin production.")
                            
                            Text("e.g. Arbutin, kojic acid, resveratrol")
                                .fontWeight(.bold)
                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.32 * minimumIndex,
                     offset: CGSize(width: 0.360 * screenWidth, height: 0.660 * screenHeight),
                     timeBeforeAppeared: 1.2,
                     label: AnyView(VStack {
                         Text("2.Antioxidant effects: Neutralizing free radicals can reduce melanin production and deposition.")
                         
                         Text("e.g. Glabridin, vitamin C")
                             .bold()
                     })),

        SingleBubble(id: 4, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: 0.160 * screenWidth, height: 0.520 * screenHeight),
                     timeBeforeAppeared: 1.7,
                     label: AnyView( VStack {
                         Text("3.Prevention of melanin transfer: Melanin is secreted from melanocytes into surrounding keratinocytes through synapses and then absorbed and transported to the surface of the skin. Reducing melanin deposition in the skin.")
                             .padding(.horizontal)
                         Text("e.g. Niacinamide")
                             .bold()
                     })),

        
        SingleBubble(id: 5, radius: 0.42 * minimumIndex,
                     offset: CGSize(width: -0.220 * screenWidth, height: 0.640 * screenHeight),
                     timeBeforeAppeared: 2.2,
                     label: AnyView( VStack {
                         Text("4.Competition with tyrosine: Directly binding to tyrosinase, preventing it from catalyzing the subsequent melanin synthesis process.")
                         
                         Text("e.g. Tranexamic acid")
                             .bold()
                     })),
        
        SingleBubble(id: 6, radius: 0.38 * minimumIndex,
                     offset: CGSize(width: -0.320 * screenWidth, height: 0.420 * screenHeight),
                     timeBeforeAppeared: 2.6,
                     label: AnyView( VStack {
                         Text("5.Promotion of exfoliation: Accelerating the metabolism of melanin, thereby reducing its deposition in the skin.")
                         
                         Text("e.g. Fruit acid")
                             .bold()
                     }))
    ]
}

struct EssenceView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables
    
    var id: Int
    var cardColor: Color
    var isLabel: Bool
    var label: CustomLabel
    var bubbles: [SingleBubble] = []
    
    // MARK: 内部变量
    let aspectRatioCap: CGFloat = 26.5 / 36
    let aspectRatioSidewall: CGFloat = 33.5 / 82.5
    var heightRatioCap: CGFloat = 36 / (36 + 82.5)
    var heightRatioSidewall: CGFloat = 82.5 / (36 + 82.5)
    
    @State private var offsetY: CGFloat = 0
    @State private var isMoved = false
    
    @State private var isPressed = false
    @State private var scaleX = 1.0
 

    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                GeometryReader { geometry in
                    HStack {
                        Spacer()
                        
                        ZStack(alignment: .bottom, content: {
                            
                            VStack(spacing: geometry.size.height * -0.01) {
                                // MARK: 精华瓶捏
                                renderPinch(geometry.size)
                                
                                // MARK:  精华瓶管子
                                renderTube(geometry.size)
                                
                                Spacer()
                            }
//                            .allowsHitTesting(!isMoved)
                            .offset(y: offsetY)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        print("WHTA\(isMoved)")
                                        if value.translation.height < 0 && abs(value.translation.height) <= geometry.size.height / 5 {
                                            self.offsetY = value.translation.height
                                        }
                                        if value.translation.height > 0 &&
                                            value.translation.height <= -offsetY {
                                            self.offsetY = 0
                                        }
                                    })
                                    .onEnded({ value in
                                        if (value.translation.height < 0 && offsetY != 0) {
                                            isMoved = true
                                            print("END\(isMoved)")
                                            
                                        }
                                        if (value.translation.height > 0 && offsetY == 0) {
                                            withAnimation {
                                                isMoved = false
                                            }
                                        }
                                    })
                            )
                            
                            // MARK: 精华瓶身
                            renderBody(geometry.size)
                            
                        })
                        .scaleEffect(0.6)
                        .scaledToFit()
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            .zIndex(2.0)
            
            if isMoved {
                renderBubble()
                    .zIndex(1.0)
            }
        }
    }
    
    func renderPinch(_ geometrySize: CGSize) -> some View {
        ParentView(description: "精华瓶捏") {
            EssenceCap( )
                .fill(K.glassGradientShadow.opacity(colorScheme == .dark ? 0.9 : 0.5))
                .frame(height: geometrySize.height * heightRatioCap)
                .cornerRadius(4)
        }
        .scaleEffect(CGSize(width: isPressed ? scaleX : 1, height: 1.0))
        .onTapGesture(perform: {
            withAnimation(.bouncy(duration: 0.5)) {
                scaleX = 0.9
                isPressed.toggle()
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation {
                    isPressed = false
                }
            }
        })
    }
    
    func renderTube(_ geometrySize: CGSize) -> some View {
        ParentView(description: "精华瓶管子") {
            SingleCornerRoundedRectangle(cornerRadius: .infinity, corners: [.bottomLeft, .bottomRight])
                .fill(K.glassGradientDark.blendMode(.difference))
                .frame(width: geometrySize.height
                       * (UIDevice.current.orientation.isPortrait ? 0.07 : 0.038)
                       , height: geometrySize.height * heightRatioSidewall * 0.9)
        }
    }
    
    func renderBody(_ geometrySize: CGSize) -> some View {
        ParentView(description: "精华瓶身") {
            EssenceSidewall()
                .fill(K.glassGradientLight)
                .aspectRatio(aspectRatioSidewall, contentMode: .fit)
                .frame(height: geometrySize.height * heightRatioSidewall)
        }
        .padding(.bottom, geometrySize.height * 0.008)
    }
    
    func renderBubble() -> some View {
        BubbleCanvas(description: "Child", isPressed: isMoved, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles) // x正右 y正下
//                    .offset(CGSize(width: 200.0, height: -300.0)) // 起始点 移动回按帽的位置
//                    .aspectRatio(contentMode: .fit)
    }
}

struct EssenceCap: CustomShape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.94643*width, y: 0.98649*height))
        path.addLine(to: CGPoint(x: 0.07143*width, y: 0.98649*height))
        path.addCurve(to: CGPoint(x: 0.03571*width, y: 0.95946*height), control1: CGPoint(x: 0.0517*width, y: 0.98649*height), control2: CGPoint(x: 0.03571*width, y: 0.97439*height))
        path.addLine(to: CGPoint(x: 0.03571*width, y: 0.64865*height))
        path.addCurve(to: CGPoint(x: 0.07143*width, y: 0.62162*height), control1: CGPoint(x: 0.03571*width, y: 0.63372*height), control2: CGPoint(x: 0.0517*width, y: 0.62162*height))
        path.addLine(to: CGPoint(x: 0.23214*width, y: 0.62162*height))
        path.addCurve(to: CGPoint(x: 0.26786*width, y: 0.59459*height), control1: CGPoint(x: 0.25187*width, y: 0.62162*height), control2: CGPoint(x: 0.26786*width, y: 0.60952*height))
        path.addLine(to: CGPoint(x: 0.26786*width, y: 0.1768*height))
        path.addCurve(to: CGPoint(x: 0.26799*width, y: 0.17467*height), control1: CGPoint(x: 0.26786*width, y: 0.17605*height), control2: CGPoint(x: 0.26788*width, y: 0.17541*height))
        path.addCurve(to: CGPoint(x: 0.50893*width, y: 0.01351*height), control1: CGPoint(x: 0.26995*width, y: 0.16101*height), control2: CGPoint(x: 0.29605*width, y: 0.01351*height))
        path.addCurve(to: CGPoint(x: 0.74987*width, y: 0.17467*height), control1: CGPoint(x: 0.72181*width, y: 0.01351*height), control2: CGPoint(x: 0.74791*width, y: 0.16101*height))
        path.addCurve(to: CGPoint(x: 0.75*width, y: 0.1768*height), control1: CGPoint(x: 0.74998*width, y: 0.17541*height), control2: CGPoint(x: 0.75*width, y: 0.17605*height))
        path.addLine(to: CGPoint(x: 0.75*width, y: 0.59459*height))
        path.addCurve(to: CGPoint(x: 0.78571*width, y: 0.62162*height), control1: CGPoint(x: 0.75*width, y: 0.60952*height), control2: CGPoint(x: 0.76599*width, y: 0.62162*height))
        path.addLine(to: CGPoint(x: 0.94643*width, y: 0.62162*height))
        path.addCurve(to: CGPoint(x: 0.98214*width, y: 0.64865*height), control1: CGPoint(x: 0.96615*width, y: 0.62162*height), control2: CGPoint(x: 0.98214*width, y: 0.63372*height))
        path.addLine(to: CGPoint(x: 0.98214*width, y: 0.95946*height))
        path.addCurve(to: CGPoint(x: 0.94643*width, y: 0.98649*height), control1: CGPoint(x: 0.98214*width, y: 0.97439*height), control2: CGPoint(x: 0.96615*width, y: 0.98649*height))
        path.closeSubpath()
        return path
    }
}

struct EssenceSidewall: CustomShape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.74286*width, y: 0.00595*height))
        path.addLine(to: CGPoint(x: 0.24286*width, y: 0.00595*height))
        path.addCurve(to: CGPoint(x: 0.21429*width, y: 0.01786*height), control1: CGPoint(x: 0.22708*width, y: 0.00595*height), control2: CGPoint(x: 0.21429*width, y: 0.01128*height))
        path.addLine(to: CGPoint(x: 0.21429*width, y: 0.12033*height))
        path.addCurve(to: CGPoint(x: 0.20665*width, y: 0.12843*height), control1: CGPoint(x: 0.21429*width, y: 0.12333*height), control2: CGPoint(x: 0.21156*width, y: 0.12622*height))
        path.addLine(to: CGPoint(x: 0.03621*width, y: 0.20491*height))
        path.addCurve(to: CGPoint(x: 0.02857*width, y: 0.21301*height), control1: CGPoint(x: 0.0313*width, y: 0.20711*height), control2: CGPoint(x: 0.02857*width, y: 0.21*height))
        path.addLine(to: CGPoint(x: 0.02857*width, y: 0.97619*height))
        path.addCurve(to: CGPoint(x: 0.05714*width, y: 0.9881*height), control1: CGPoint(x: 0.02857*width, y: 0.98277*height), control2: CGPoint(x: 0.04136*width, y: 0.9881*height))
        path.addLine(to: CGPoint(x: 0.95714*width, y: 0.9881*height))
        path.addCurve(to: CGPoint(x: 0.98571*width, y: 0.97619*height), control1: CGPoint(x: 0.97292*width, y: 0.9881*height), control2: CGPoint(x: 0.98571*width, y: 0.98277*height))
        path.addLine(to: CGPoint(x: 0.98571*width, y: 0.21351*height))
        path.addCurve(to: CGPoint(x: 0.97664*width, y: 0.2048*height), control1: CGPoint(x: 0.98571*width, y: 0.21021*height), control2: CGPoint(x: 0.98243*width, y: 0.20705*height))
        path.addLine(to: CGPoint(x: 0.78051*width, y: 0.12853*height))
        path.addCurve(to: CGPoint(x: 0.77143*width, y: 0.11983*height), control1: CGPoint(x: 0.77471*width, y: 0.12628*height), control2: CGPoint(x: 0.77143*width, y: 0.12313*height))
        path.addLine(to: CGPoint(x: 0.77143*width, y: 0.01786*height))
        path.addCurve(to: CGPoint(x: 0.74286*width, y: 0.00595*height), control1: CGPoint(x: 0.77143*width, y: 0.01128*height), control2: CGPoint(x: 0.75864*width, y: 0.00595*height))
        path.closeSubpath()
        return path    }
}
