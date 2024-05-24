//
//  File.swift
//  
//
//  Created by Euan on 2024/2/25.
//

import SwiftUI

struct IntroView: View {
    @Environment(\.colorScheme) var colorScheme

    @EnvironmentObject var globalVariables: GlobalVariables

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack(alignment: .center) {
                VStack {
                    Spacer()
                    
                    //                HStack{
                    if colorScheme == .light {
                        HandView()
                            .scaleEffect(0.7)
                            .allowsTightening(false)
                            .rotationEffect(Angle(degrees: -180))
                            .padding(.top, horizontalSizeClass == .regular ? 500 : 50)
                            .padding(.leading, horizontalSizeClass == .regular ? 380 : 50)
                            .colorInvert()
                    } else {
                        HandView()
                            .scaleEffect(0.7)
                            .allowsTightening(false)
                            .rotationEffect(Angle(degrees: -180))
                            .padding(.top, horizontalSizeClass == .regular ? 500 : 50)
                            .padding(.leading, horizontalSizeClass == .regular ? 380 : 50)
                    }
                }
                
                
                InquiryFaceView()
                
                Image("Logo")
                    .zIndex(10.0)
            }
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)

    }
    
}
