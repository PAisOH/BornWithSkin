//
//  BubbleCanvas.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/25.
//

import SwiftUI


/// Example of BubbleCanvas_View
struct TestBubbleView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            BubbleCanvas(description: "绿色方形", isPressed: true)
        }
    }
}

/// Drawing bubble effect
struct BubbleCanvas: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var description: String
    
    @State var isPressed: Bool = true
    @State var isShow: Bool = false
    @State var isText: Bool = false
    
    @State var startLocation: CGPoint = .zero
    
    // width - x 正右, height - y正下，原点在左上角
    /// Example data
    var bubbles: [SingleBubble] = [
        SingleBubble(id: 1, offset: CGSize(width: -380, height: 300), timeBeforeAppeared: 1.2),
        SingleBubble(id: 2, offset: CGSize(width: 0, height: -160), timeBeforeAppeared: 0.8),
        SingleBubble(id: 3, offset: CGSize(width: 0, height: -300), timeBeforeAppeared: 0.7)
    ]
    
    @ViewBuilder
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .overlay {
                makeCanvas()
            }
    }
    
    @ViewBuilder
    func makeBubble(singleBubble: SingleBubble) -> some View {
        ZStack {
            Circle()
                .frame(width: singleBubble.radius)
            .tag(singleBubble.id)
                
        }
    }
    
    func loadTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isShow.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isText.toggle()
            }
        }
    }
    
    @ViewBuilder
    func makeCanvas() -> some View {
        
        // 绘制泡泡
        if isPressed {
            Canvas(colorMode: .linear,
                   rendersAsynchronously: false) { context, size in
                
                // 设置画布原点坐标
                context.translateBy(x: -size.width / 2 + startLocation.x, y: -size.height / 2 + startLocation.y)
                context.addFilter(.alphaThreshold(min: 0.4, color: colorScheme == .light ? .black : .white))
                context.addFilter(.blur(radius: 10))
                context.drawLayer { drawingContext in
                    let drawPoint = CGPoint(x: size.width, y: size.height)
                    
                    for index in 1...bubbles.count {
                        if let symbol = context.resolveSymbol(id: index) {
                            drawingContext.draw(symbol, at: drawPoint)
                        }
                    }
                }
            } symbols: {
                // 负左上
                ForEach(bubbles) { bubble in
                    makeBubble(singleBubble: bubble)
                        .scaleEffect(isShow ? 1 : 0.01)
                        .offset(isShow ? bubble.offset : CGSizeZero)
                        .animation(Animation.spring(response: 1, dampingFraction: 0.8).delay(isShow ? bubble.timeBeforeAppeared : 0.1), value: isShow)
                }
            }
            .onAppear {
                loadTimer()
            }
        }
        
        //绘制文字
        if isShow {
            Canvas(colorMode: .linear,
                   rendersAsynchronously: false) { context, size in
                
                context.translateBy(x: -size.width / 2 + startLocation.x, y: -size.height / 2 + startLocation.y)

                context.addFilter(.alphaThreshold(min: 0.4, color: colorScheme == .light ? .white : .black.opacity(0.75)))
                context.drawLayer { drawingContext in
                    let drawPoint = CGPoint(x: size.width, y: size.height)
                    
                    for index in 1...bubbles.count {
                        if let symbol = context.resolveSymbol(id: index) {
                            drawingContext.draw(symbol, at: drawPoint)
                        }
                    }
                }
            } symbols: {
                // 负左上
                ForEach(bubbles) { bubble in
                    bubble.label
//                    Text(bubble.label.text)
//                        .font(bubble.label.font)
                        .scaleEffect(isText ? 1 : 0.01)
                        .offset(isText ? bubble.offset : CGSizeZero)
                        .animation(Animation.spring(response: 1, dampingFraction: 0.8).delay(isText ? bubble.timeBeforeAppeared : 0.1))
//                        .multilineTextAlignment(.center)
//                        .lineLimit(5)
//                        .dynamicTypeSize(.xLarge)
                        .minimumScaleFactor(0.5)
                        .frame(width: bubble.radius * 0.8, height: bubble.radius * 0.8)
                }
            }
        }
    }
}


/// Single bubble with text
struct SingleBubble: Identifiable {
    var id: Int
    var radius: CGFloat = 300
    /// The origin is in the upper left corner, +width -> right, +height -> bottom
    var offset: CGSize = CGSize(width: 0, height: 100)
    /// Time before the bubble appeared
    var timeBeforeAppeared: CGFloat = 1
    var isLabel: Bool = false
    var label: AnyView?
}


