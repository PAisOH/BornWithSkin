//
//  BasicComponents.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/24.
//

import SwiftUI


/// A rectangle with selected rounded corners
struct SingleCornerRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
