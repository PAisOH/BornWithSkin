//
//  GlobalVariables.swift
//  OrganicSkin
//
//  Created by Euan on 2024/1/30.
//

import SwiftUI

class GlobalVariables: ObservableObject {
    @Published var currentMode: ColorScheme = .light
    @Published var currentPrimaryColor: Color = .red
    @Published var currentBGColor: Color = .green
    @Published var currentDeviceSize: CGSize = .zero
    @Published var isPortrait: Bool = (UIScreen.main.bounds.height > UIScreen.main.bounds.width)
    @Published var isEnterProductViewAbstract: Bool = false
    @Published var isFirstLaunch: Bool =  UserDefaults.standard.bool(forKey: "isFirstLaunch")
    @Published var skinType: String = (UserDefaults.standard.string(forKey: "skinType") ?? "Normal")
}


