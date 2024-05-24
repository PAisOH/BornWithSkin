//
//  CreamView.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/23.
//

import SwiftUI

class AntiAgingCreamPage: ProductViewAbstract {
    @EnvironmentObject var globalVariables: GlobalVariables
        
    @State private var isRotating: Bool = false
    @State private var angle: Double = 0
    @State private var distance: Double = 0.5
    
    init() {
        super.init(id: 7, cardColor: Color(hex: 0xe1c274), isLabel: true, label: CustomLabel(text: "Anti-Aging Cream"), typicalIngredients: K.ingredAntiAging, bubbles: bubblesAntiAging, alertText: "Please tap the the lid")
    }
    
    override func renderActiveView() -> AnyView {
        AnyView(
            CreamView(id: id, cardColor: cardColor, isLabel: isLabel, label: label!, isEnter: isEnter, bubbles: bubbles)
        )
    }
    
    // MARK: inner UI parameters
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static private let minimumIndex = UIDevice.current.orientation == .portrait ? screenWidth : screenHeight
    
    // MARK: bubble data
    // 用geometry比例，width正右 height正下
    var bubblesAntiAging: [SingleBubble] = [
        SingleBubble(id: 1, radius: 0.500 * minimumIndex,
                     offset: CGSize(width: 0.300 * screenWidth, height: 0.07 * screenHeight),
                     timeBeforeAppeared: 0.5,
                     label: AnyView(
                        Text("Retinol ")
                            .bold()
                            .font(.system(size: 28, weight: .bold, design: .serif))
                        +
                         Text("is one of the three derivatives of vitamin A, along with retinaldehyde and retinyl esters. Whether it is retinoic acid, retinaldehyde, or retinyl esters, these vitamin A derivatives need to be converted into retinoic acid to be effective. However, retinoic acid is too irritating to be directly used in skincare products. Retinol, also known as vitamin A alcohol, has a better effect and is relatively less irritating, so it is commonly used in skincare products.")
                            .bold()
                        //                                .font(.title3)
                     )),
        
        SingleBubble(id: 2, radius: 0.450 * minimumIndex,
                     offset: CGSize(width: 0.360 * screenWidth, height: 0.420 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(
                        VStack(alignment: .center) {
                            Text("Peptides ")
                                .font(.system(size: 28, weight: .bold, design: .serif))
                            +
                            Text("are small molecular collagen proteins that naturally exist in the skin. They are a combination of various oligopeptides. Peptides have comprehensive effects on the skin, and different peptides have different functions. Their effects are not limited to the extracellular matrix but also involve the connection between the matrix and cells.")

                        }
                     )),
        
        SingleBubble(id: 3, radius: 0.48 * minimumIndex,
                     offset: CGSize(width: -0.170 * screenWidth, height: 0.660 * screenHeight),
                     timeBeforeAppeared: 0.7,
                     label: AnyView(VStack(spacing: 0) {
                         Text("The chemical name of ")
                         + Text("Bosyinis")
                             .font(.system(size: 28, weight: .bold, design: .serif))
                         + Text("\nis \"Hydroxypropyl tetrahydropyrantriol\".\nReports indicate that a 3% concentration of Bosyin can improve the condition of the skin. It is considered a relatively gentle ingredient that can be used by everyone. Bosyin was originally extracted from the birch tree as a xylose, but nowadays it is mostly synthesized in laboratories.")
                     }
                                   ))
    ]
}

struct CreamView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var globalVariables: GlobalVariables
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
    
    var id: Int
    var cardColor: Color
    var isLabel: Bool
    var label: CustomLabel
    var isEnter: Bool
    var bubbles: [SingleBubble] = []

    private let aspectRatio: CGFloat = 89 / 84
    private let aspectRatioCap: CGFloat = 89 / 20
    private let aspectRatioBody: CGFloat = 89 / 64
    private let heightRatioCap: CGFloat = 20 / 304
    private let heightRatioBody: CGFloat = 64 / 304
    private let heightRatioCreamToAll: CGFloat = 84 / 304

    private let aspectRatioHand: CGFloat = 679 / 304
        
    @State private var isRotating = false
    @State private var angle: Double = 0
    @State private var distance: Double = 0.5
    
    static private let screenWidth: CGFloat =  UIScreen.main.bounds.size.width
    static private let screenHeight: CGFloat = UIScreen.main.bounds.size.height


    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                renderActiveCream(geometrySize: geometry.size)
//                    .scaleEffect(isEnter ? 1.2 : 1)
                    .zIndex(2.0)
                
                if isRotating && !bubbles.isEmpty {
                    renderBubble(geometrySize: .zero)
                        .zIndex(1.0)
                }
                
            }
        }
//        .aspectRatio(UIScreen.main.bounds.width / UIScreen.main.bounds.height ,contentMode: .fit)
    }
    
    func renderActiveCream(geometrySize: CGSize) -> some View {
        ZStack {
            // MARK: Finger Above
            if isEnter && !isCompact {
                ZStack {
                    Finger5()
                        .fill(Gradient(colors: [.gray, .black]).shadow(.inner(radius: 20)))
                        .zIndex(3.0)
                    Finger4()
                        .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
                        .zIndex(2.0)
                    Finger3()
                        .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
                        .zIndex(1.0)
                }
                .drawingGroup(opaque: false)
                .aspectRatio(679 / 304.0, contentMode: .fit)
                .offset(CGSize(width: UIScreen.main.bounds.width * -0.35, height: UIScreen.main.bounds.height * -0.1))
                .zIndex(3.0)
                .rotationEffect(Angle.init(degrees: angle), anchor: .bottomLeading)
                .offset(x: isRotating ? geometrySize.width * 0.4 * distance : 0, y: isRotating ? geometrySize.height * 0.5 * distance : 0)
            }
            
            // MARK: Cream
            HStack {
                Spacer()
                
                VStack(spacing: 0) {
                    Spacer()
                    renderCap(geometrySize: geometrySize)
                    renderBox(geometrySize: geometrySize)
                    Spacer()
                }
                Spacer()
            }
            .zIndex(2.0)
            
            // MARK: Finger Below
            if isEnter && !isCompact {
                Finger1()
                    .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
                    .zIndex(1.0)
                    .drawingGroup(opaque: false)
                    .aspectRatio(679 / 304.0, contentMode: .fit)
                    .offset(CGSize(width: UIScreen.main.bounds.width * -0.35, height: UIScreen.main.bounds.height * -0.1)) // 起始offset
                    .zIndex(1.0)
                    .rotationEffect(Angle.init(degrees: angle), anchor: .bottomLeading)
                    .offset(x: isRotating ? geometrySize.width * 0.4 * distance : 0, y: isRotating ? geometrySize.height * 0.5 * distance : 0)
            }
        }
    }
    
    func renderCap(geometrySize: CGSize) -> some View {
        return  ParentView(description: "Cap") {
            Rectangle()
                .fill(K.glassGradientShadow.opacity(colorScheme == .light ? 0.3 : 0.7).shadow(.inner(color: globalVariables.currentPrimaryColor, radius: 50)))

                .aspectRatio(aspectRatioCap, contentMode: .fit)
                .frame(height: geometrySize.height * heightRatioCap)
        }
        .clipShape(.rect(cornerRadius: geometrySize.width * (isEnter ? 0.01 : 0.03)))
        .rotationEffect(Angle.init(degrees: angle), anchor: .bottomLeading)
//        .offset(y: isRotating ? geometrySize.height * distance : 0)
        .onTapGesture {
            print("111 \(isRotating)")
            withAnimation(.bouncy(duration: 1.5)) {
                isRotating.toggle()
                angle = isRotating ? -30 : 0
                print("222 \(isRotating)")
            }
            
            Timer.scheduledTimer(withTimeInterval: 500, repeats: false) { _ in
                print("333 \(isRotating)")
                withAnimation {
                    isRotating = false
                    angle = 0
                }
                print("444 \(isRotating)")
            }
        }
    }
    
    func renderBox(geometrySize: CGSize) -> some View {
        return  ParentView(description: "Box") {
            Rectangle()
                .fill(K.glassGradientDark)

                .aspectRatio(aspectRatioBody, contentMode: .fit)
                .frame(height: geometrySize.height * heightRatioBody)
        }
        .clipShape(.rect(cornerRadius: geometrySize.width * (isEnter ? 0.02 : 0.03)))
    }
    
    func renderBubble(geometrySize: CGSize) -> some View {
        return  BubbleCanvas(description: "Child", isPressed: isRotating, startLocation: CGPoint(x: 0, y: -300), bubbles: bubbles) // x正右 y正下
    }
    
    
}

struct CreamCap: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.69597*width, y: 0.38842*height))
        path.addLine(to: CGPoint(x: 0.9561*width, y: 0.39229*height))
        path.addCurve(to: CGPoint(x: 0.96149*width, y: 0.40388*height), control1: CGPoint(x: 0.9591*width, y: 0.39233*height), control2: CGPoint(x: 0.96151*width, y: 0.39752*height))
        path.addLine(to: CGPoint(x: 0.96115*width, y: 0.50702*height))
        path.addCurve(to: CGPoint(x: 0.95568*width, y: 0.51846*height), control1: CGPoint(x: 0.96113*width, y: 0.51338*height), control2: CGPoint(x: 0.95868*width, y: 0.5185*height))
        path.addLine(to: CGPoint(x: 0.69555*width, y: 0.51459*height))
        path.addCurve(to: CGPoint(x: 0.69016*width, y: 0.50299*height), control1: CGPoint(x: 0.69256*width, y: 0.51454*height), control2: CGPoint(x: 0.69014*width, y: 0.50935*height))
        path.addLine(to: CGPoint(x: 0.6905*width, y: 0.39985*height))
        path.addCurve(to: CGPoint(x: 0.69597*width, y: 0.38842*height), control1: CGPoint(x: 0.69053*width, y: 0.39349*height), control2: CGPoint(x: 0.69297*width, y: 0.38838*height))
        path.closeSubpath()
        return path
    }
}

struct CreamBox: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addRect(CGRect(x: 0.69147*width, y: 0.51247*height, width: 0.27099*width, height: 0.41098*height))
        return path
    }
}
