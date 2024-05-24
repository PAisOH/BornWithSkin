//
//  CustomShape.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/22.
//

import SwiftUI

struct CustomLabel {
    
    var color: Color = Color.black.opacity(0.7)
    var cornerRadius: CGFloat = 8
    var text: String = "Test"
    var font: Font = .system(size: 48, weight: .bold, design: .serif)
    var foregroundColor: Color = .primary
    var offSet: CGSize = CGSize(width: 50, height: 100) //0左上角 +右下
    var width: CGFloat = 72.0
    var height: CGFloat = 40.0
    
    
}

struct ParentView<ChildView: View>: View {
    let description: String
//    var isLabel: Bool = false
//    var label: CustomLabel = CustomLabel()
    var childView: () -> ChildView
    
    var body: some View {
        ZStack(alignment: .leading) {
            childView()
                .overlay(GeometryReader {geometry in
                    Path { path in
                        path.addRect(CGRect(x: 0, y: 0, width: geometry.size.width / 2, height: geometry.size.height))
                    }
                    .fill(K.glassGradientShadow)
//                    .opacity(0.7)
                    .blur(radius: 10)
                    .blendMode(.overlay)
                })
                .overlay(GeometryReader { geometry in
                    Image("noise")
                        .resizable()
                        .blendMode(.softLight)
                    //                        .opacity(0.5)
                })
        }
    }
}


protocol CustomShape: Shape {
    func path(in rect: CGRect) -> Path
}
