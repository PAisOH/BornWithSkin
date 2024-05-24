//
//  File.swift
//  
//
//  Created by Euan on 2024/2/21.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @Environment(\.colorScheme) var colorScheme
    
//    @Binding var isLeft

    static func getPointPercent(x: CGFloat, y: CGFloat) -> UnitPoint {
        let father: CGSize = CGSize(width: 500, height: 769)
        return UnitPoint(x: x / father.width, y: y / father.height)
    }
    
    private var aspectRatio: CGFloat = 500 / 769
    
    private var faceGradient = LinearGradient(colors: [.white, Color(hex: 0xD6D6D6).opacity(0.5), .white.opacity(0.75)], startPoint: getPointPercent(x: 178 + (322 * 0.4), y: 0), endPoint: getPointPercent(x: 500 - (322 * 0.2), y: 416))
    
    private var neckGradient = LinearGradient(colors: [.white, Color(hex: 0x454545).opacity(0)], startPoint: getPointPercent(x: 0 + 224, y: 321), endPoint: getPointPercent(x:  0 + 204, y: 769))
    
    private var eyeLGradient = LinearGradient(colors: [.black.opacity(0.3), .white], startPoint: getPointPercent(x: 306 + 75/2, y: 198), endPoint: getPointPercent(x: 306 + 75/2, y: 198 + 20))
    private var eyeRGradient = LinearGradient(colors: [.black.opacity(0.3), .white], startPoint: getPointPercent(x: 434 + 27, y: 201), endPoint: getPointPercent(x: 434 + 27, y: 201 + 19))
    
    private var browLGradient = LinearGradient(colors: [.black.opacity(0.2), .white], startPoint: getPointPercent(x: 434 + 27, y: 201), endPoint: getPointPercent(x: 434 + 27, y: 201 + 19))
    private var browRGradient = LinearGradient(colors: [.black.opacity(0.2), .white], startPoint: getPointPercent(x: 434 + 27, y: 201), endPoint: getPointPercent(x: 434 + 27, y: 201 + 19))
    
    private var MouthGradient = LinearGradient(colors: [.black, .black.opacity(0.3)], startPoint: getPointPercent(x: 384, y: 311), endPoint: getPointPercent(x: 384, y: 311 + 46))

    private var earGradient = LinearGradient(colors: [Color(hex: 0xD9D9D9), .black.opacity(0.2)], startPoint: getPointPercent(x: 169 + 10, y: 214), endPoint: getPointPercent(x: 169 + 74, y: 214 + 106))

    
    var body: some View {
        ZStack {
            if colorScheme == .light {
                PersonFace()
                    .fill(faceGradient)
                    .colorInvert()
                    .blur(radius: 5)

                PersonEar()
                    .fill(earGradient)
                    .colorInvert()
                    .blur(radius: 2)

                PersonNeck()
                    .fill(neckGradient)
                    .colorInvert()
                    .blur(radius: 2)

                PersonBrowLeft()
                    .fill(browLGradient)
                
                PersonBrowRightAndNose()
                    .fill(browRGradient)
                
                PersonMouth()
                    .fill(MouthGradient)
                    .colorInvert()

                PersonEyeRight()
                    .fill(eyeRGradient)
                
                PersonEyeLeft()
                    .fill(eyeLGradient)
            } else {
                PersonFace()
                    .fill(faceGradient)
                    .blur(radius: 5)

                PersonEar()
                    .fill(earGradient)
                
                PersonNeck()
                    .fill(neckGradient)
                    .blur(radius: 2)
                
                PersonBrowLeft()
                    .fill(browLGradient)
                
                PersonBrowRightAndNose()
                    .fill(browRGradient)
                
                PersonMouth()
                    .fill(MouthGradient)

                PersonEyeRight()
                    .fill(eyeRGradient)

                PersonEyeLeft()
                    .fill(eyeLGradient)

            }
            
//            LinearGradient(colors: [.green, .indigo, .blue, .red, .yellow, .white, .brown], startPoint: .top, endPoint: .bottom)
//                .blendMode(.overlay)
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .overlay(
            Image("noise")
                .resizable()
                .blendMode(.softLight)
                .opacity(0.17)
        )
    }
}

struct PersonBrowLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.67921*width, y: 0.216*height))
        path.addLine(to: CGPoint(x: 0.76733*width, y: 0.22998*height))
        path.addLine(to: CGPoint(x: 0.778*width, y: 0.21518*height))
        path.addCurve(to: CGPoint(x: 0.65247*width, y: 0.20375*height), control1: CGPoint(x: 0.778*width, y: 0.21518*height), control2: CGPoint(x: 0.69296*width, y: 0.19502*height))
        path.addCurve(to: CGPoint(x: 0.62436*width, y: 0.21214*height), control1: CGPoint(x: 0.64097*width, y: 0.20623*height), control2: CGPoint(x: 0.62436*width, y: 0.21214*height))
        path.addLine(to: CGPoint(x: 0.58602*width, y: 0.23276*height))
        path.addCurve(to: CGPoint(x: 0.64467*width, y: 0.21357*height), control1: CGPoint(x: 0.58691*width, y: 0.23228*height), control2: CGPoint(x: 0.61926*width, y: 0.215*height))
        path.addCurve(to: CGPoint(x: 0.67921*width, y: 0.216*height), control1: CGPoint(x: 0.65817*width, y: 0.21282*height), control2: CGPoint(x: 0.67921*width, y: 0.216*height))
        path.closeSubpath()
        return path
    }
}

struct PersonBrowRightAndNose: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.96398*width, y: 0.22037*height))
        path.addCurve(to: CGPoint(x: 0.994*width, y: 0.2238*height), control1: CGPoint(x: 0.97603*width, y: 0.22121*height), control2: CGPoint(x: 0.994*width, y: 0.2238*height))
        path.addCurve(to: CGPoint(x: 0.97561*width, y: 0.21182*height), control1: CGPoint(x: 0.994*width, y: 0.2238*height), control2: CGPoint(x: 0.9884*width, y: 0.2172*height))
        path.addCurve(to: CGPoint(x: 0.87531*width, y: 0.22624*height), control1: CGPoint(x: 0.95275*width, y: 0.2022*height), control2: CGPoint(x: 0.88984*width, y: 0.21253*height))
        path.addCurve(to: CGPoint(x: 0.8526*width, y: 0.27841*height), control1: CGPoint(x: 0.85916*width, y: 0.24147*height), control2: CGPoint(x: 0.85641*width, y: 0.25569*height))
        path.addCurve(to: CGPoint(x: 0.85096*width, y: 0.37172*height), control1: CGPoint(x: 0.84794*width, y: 0.31665*height), control2: CGPoint(x: 0.85096*width, y: 0.37172*height))
        path.addCurve(to: CGPoint(x: 0.87046*width, y: 0.3771*height), control1: CGPoint(x: 0.85096*width, y: 0.37172*height), control2: CGPoint(x: 0.8622*width, y: 0.37746*height))
        path.addCurve(to: CGPoint(x: 0.88322*width, y: 0.37397*height), control1: CGPoint(x: 0.87576*width, y: 0.37687*height), control2: CGPoint(x: 0.88322*width, y: 0.37397*height))
        path.addCurve(to: CGPoint(x: 0.8526*width, y: 0.27841*height), control1: CGPoint(x: 0.88322*width, y: 0.37397*height), control2: CGPoint(x: 0.86183*width, y: 0.31896*height))
        path.addCurve(to: CGPoint(x: 0.88249*width, y: 0.23209*height), control1: CGPoint(x: 0.86238*width, y: 0.25477*height), control2: CGPoint(x: 0.86768*width, y: 0.23937*height))
        path.addCurve(to: CGPoint(x: 0.96398*width, y: 0.22037*height), control1: CGPoint(x: 0.91582*width, y: 0.21568*height), control2: CGPoint(x: 0.9539*width, y: 0.21967*height))
        path.closeSubpath()
        return path
    }
}

struct PersonMouth: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.924*width, y: 0.43761*height))
        path.addCurve(to: CGPoint(x: 0.88842*width, y: 0.40786*height), control1: CGPoint(x: 0.924*width, y: 0.43761*height), control2: CGPoint(x: 0.90983*width, y: 0.4054*height))
        path.addCurve(to: CGPoint(x: 0.87131*width, y: 0.41378*height), control1: CGPoint(x: 0.8811*width, y: 0.4087*height), control2: CGPoint(x: 0.87131*width, y: 0.41378*height))
        path.addCurve(to: CGPoint(x: 0.8465*width, y: 0.40484*height), control1: CGPoint(x: 0.87131*width, y: 0.41378*height), control2: CGPoint(x: 0.8572*width, y: 0.40633*height))
        path.addCurve(to: CGPoint(x: 0.78511*width, y: 0.43475*height), control1: CGPoint(x: 0.81715*width, y: 0.40076*height), control2: CGPoint(x: 0.81362*width, y: 0.42792*height))
        path.addCurve(to: CGPoint(x: 0.768*width, y: 0.44067*height), control1: CGPoint(x: 0.77874*width, y: 0.43628*height), control2: CGPoint(x: 0.768*width, y: 0.44067*height))
        path.addLine(to: CGPoint(x: 0.79457*width, y: 0.45117*height))
        path.addCurve(to: CGPoint(x: 0.83689*width, y: 0.46424*height), control1: CGPoint(x: 0.79457*width, y: 0.45117*height), control2: CGPoint(x: 0.81878*width, y: 0.46432*height))
        path.addCurve(to: CGPoint(x: 0.85754*width, y: 0.46144*height), control1: CGPoint(x: 0.84508*width, y: 0.4642*height), control2: CGPoint(x: 0.85754*width, y: 0.46144*height))
        path.addCurve(to: CGPoint(x: 0.8795*width, y: 0.46302*height), control1: CGPoint(x: 0.85754*width, y: 0.46144*height), control2: CGPoint(x: 0.87091*width, y: 0.4637*height))
        path.addCurve(to: CGPoint(x: 0.924*width, y: 0.43761*height), control1: CGPoint(x: 0.90159*width, y: 0.46128*height), control2: CGPoint(x: 0.924*width, y: 0.43761*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.87033*width, y: 0.43231*height))
        path.addCurve(to: CGPoint(x: 0.88185*width, y: 0.436*height), control1: CGPoint(x: 0.87601*width, y: 0.43272*height), control2: CGPoint(x: 0.88185*width, y: 0.436*height))
        path.addCurve(to: CGPoint(x: 0.86542*width, y: 0.43768*height), control1: CGPoint(x: 0.88185*width, y: 0.436*height), control2: CGPoint(x: 0.87358*width, y: 0.43812*height))
        path.addCurve(to: CGPoint(x: 0.83993*width, y: 0.43298*height), control1: CGPoint(x: 0.85651*width, y: 0.4372*height), control2: CGPoint(x: 0.8397*width, y: 0.43439*height))
        path.addCurve(to: CGPoint(x: 0.85236*width, y: 0.43101*height), control1: CGPoint(x: 0.84016*width, y: 0.43157*height), control2: CGPoint(x: 0.8482*width, y: 0.43054*height))
        path.addCurve(to: CGPoint(x: 0.86012*width, y: 0.43301*height), control1: CGPoint(x: 0.85653*width, y: 0.43149*height), control2: CGPoint(x: 0.85613*width, y: 0.43272*height))
        path.addCurve(to: CGPoint(x: 0.87033*width, y: 0.43231*height), control1: CGPoint(x: 0.86293*width, y: 0.43321*height), control2: CGPoint(x: 0.86735*width, y: 0.43209*height))
        path.closeSubpath()
        return path
    }
}

struct PersonEyeRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.96079*width, y: 0.26566*height))
        path.addCurve(to: CGPoint(x: 0.978*width, y: 0.27525*height), control1: CGPoint(x: 0.96847*width, y: 0.26873*height), control2: CGPoint(x: 0.978*width, y: 0.27525*height))
        path.addCurve(to: CGPoint(x: 0.92817*width, y: 0.28608*height), control1: CGPoint(x: 0.978*width, y: 0.27525*height), control2: CGPoint(x: 0.94917*width, y: 0.28596*height))
        path.addCurve(to: CGPoint(x: 0.868*width, y: 0.27107*height), control1: CGPoint(x: 0.90283*width, y: 0.28623*height), control2: CGPoint(x: 0.868*width, y: 0.27107*height))
        path.addCurve(to: CGPoint(x: 0.96079*width, y: 0.26566*height), control1: CGPoint(x: 0.868*width, y: 0.27107*height), control2: CGPoint(x: 0.93039*width, y: 0.25351*height))
        path.closeSubpath()
        return path
    }
}

struct PersonEyeLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.69541*width, y: 0.25781*height))
        path.addCurve(to: CGPoint(x: 0.762*width, y: 0.2768*height), control1: CGPoint(x: 0.72369*width, y: 0.25981*height), control2: CGPoint(x: 0.762*width, y: 0.2768*height))
        path.addCurve(to: CGPoint(x: 0.68713*width, y: 0.28318*height), control1: CGPoint(x: 0.762*width, y: 0.2768*height), control2: CGPoint(x: 0.71672*width, y: 0.28517*height))
        path.addCurve(to: CGPoint(x: 0.63121*width, y: 0.27403*height), control1: CGPoint(x: 0.66367*width, y: 0.2816*height), control2: CGPoint(x: 0.6468*width, y: 0.27902*height))
        path.addCurve(to: CGPoint(x: 0.612*width, y: 0.26618*height), control1: CGPoint(x: 0.62163*width, y: 0.27096*height), control2: CGPoint(x: 0.612*width, y: 0.26618*height))
        path.addCurve(to: CGPoint(x: 0.63493*width, y: 0.26391*height), control1: CGPoint(x: 0.612*width, y: 0.26618*height), control2: CGPoint(x: 0.62765*width, y: 0.26447*height))
        path.addCurve(to: CGPoint(x: 0.69541*width, y: 0.25781*height), control1: CGPoint(x: 0.66041*width, y: 0.26194*height), control2: CGPoint(x: 0.66985*width, y: 0.25601*height))
        path.closeSubpath()
        return path
    }
}

struct PersonFace: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99702*width, y: 0.22487*height))
        path.addCurve(to: CGPoint(x: 0.99024*width, y: 0.26571*height), control1: CGPoint(x: 0.99688*width, y: 0.24091*height), control2: CGPoint(x: 0.99024*width, y: 0.26571*height))
        path.addCurve(to: CGPoint(x: 0.9989*width, y: 0.34895*height), control1: CGPoint(x: 0.99024*width, y: 0.26571*height), control2: CGPoint(x: 1.00389*width, y: 0.31653*height))
        path.addCurve(to: CGPoint(x: 0.96245*width, y: 0.43302*height), control1: CGPoint(x: 0.99368*width, y: 0.38289*height), control2: CGPoint(x: 0.96245*width, y: 0.43302*height))
        path.addCurve(to: CGPoint(x: 0.92343*width, y: 0.49559*height), control1: CGPoint(x: 0.96245*width, y: 0.43302*height), control2: CGPoint(x: 0.94614*width, y: 0.47376*height))
        path.addCurve(to: CGPoint(x: 0.84841*width, y: 0.54096*height), control1: CGPoint(x: 0.88724*width, y: 0.53036*height), control2: CGPoint(x: 0.84841*width, y: 0.54096*height))
        path.addCurve(to: CGPoint(x: 0.67879*width, y: 0.51572*height), control1: CGPoint(x: 0.84841*width, y: 0.54096*height), control2: CGPoint(x: 0.73997*width, y: 0.53233*height))
        path.addCurve(to: CGPoint(x: 0.48035*width, y: 0.41782*height), control1: CGPoint(x: 0.58729*width, y: 0.49089*height), control2: CGPoint(x: 0.54237*width, y: 0.46821*height))
        path.addCurve(to: CGPoint(x: 0.37604*width, y: 0.28255*height), control1: CGPoint(x: 0.42359*width, y: 0.3717*height), control2: CGPoint(x: 0.39814*width, y: 0.33911*height))
        path.addCurve(to: CGPoint(x: 0.37832*width, y: 0.13344*height), control1: CGPoint(x: 0.35348*width, y: 0.22478*height), control2: CGPoint(x: 0.34459*width, y: 0.18886*height))
        path.addCurve(to: CGPoint(x: 0.5341*width, y: 0.02043*height), control1: CGPoint(x: 0.40926*width, y: 0.08259*height), control2: CGPoint(x: 0.45202*width, y: 0.04665*height))
        path.addCurve(to: CGPoint(x: 0.74868*width, y: 0.00885*height), control1: CGPoint(x: 0.60961*width, y: -0.0037*height), control2: CGPoint(x: 0.66732*width, y: -0.00496*height))
        path.addCurve(to: CGPoint(x: 0.88022*width, y: 0.05407*height), control1: CGPoint(x: 0.80489*width, y: 0.01838*height), control2: CGPoint(x: 0.83669*width, y: 0.02901*height))
        path.addCurve(to: CGPoint(x: 0.96836*width, y: 0.13889*height), control1: CGPoint(x: 0.92622*width, y: 0.08055*height), control2: CGPoint(x: 0.94503*width, y: 0.10189*height))
        path.addCurve(to: CGPoint(x: 0.99702*width, y: 0.22487*height), control1: CGPoint(x: 0.9884*width, y: 0.17067*height), control2: CGPoint(x: 0.99733*width, y: 0.19051*height))
        path.closeSubpath()
        return path
    }
}

struct PersonEar: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.42041*width, y: 0.28826*height))
        path.addCurve(to: CGPoint(x: 0.47237*width, y: 0.33755*height), control1: CGPoint(x: 0.45248*width, y: 0.29883*height), control2: CGPoint(x: 0.47237*width, y: 0.33755*height))
        path.addCurve(to: CGPoint(x: 0.48422*width, y: 0.37865*height), control1: CGPoint(x: 0.47237*width, y: 0.33755*height), control2: CGPoint(x: 0.48254*width, y: 0.36377*height))
        path.addCurve(to: CGPoint(x: 0.46781*width, y: 0.41507*height), control1: CGPoint(x: 0.4859*width, y: 0.39353*height), control2: CGPoint(x: 0.49145*width, y: 0.40941*height))
        path.addCurve(to: CGPoint(x: 0.40303*width, y: 0.39307*height), control1: CGPoint(x: 0.44467*width, y: 0.42062*height), control2: CGPoint(x: 0.42258*width, y: 0.40285*height))
        path.addCurve(to: CGPoint(x: 0.34529*width, y: 0.32861*height), control1: CGPoint(x: 0.36485*width, y: 0.37395*height), control2: CGPoint(x: 0.36045*width, y: 0.35826*height))
        path.addCurve(to: CGPoint(x: 0.35277*width, y: 0.2835*height), control1: CGPoint(x: 0.33746*width, y: 0.31329*height), control2: CGPoint(x: 0.3312*width, y: 0.29439*height))
        path.addCurve(to: CGPoint(x: 0.42041*width, y: 0.28826*height), control1: CGPoint(x: 0.37369*width, y: 0.27292*height), control2: CGPoint(x: 0.39672*width, y: 0.28045*height))
        path.closeSubpath()
        return path
    }
}

struct PersonNeck: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.60825*width, y: 0.73909*height))
        path.addCurve(to: CGPoint(x: 0.794*width, y: 0.53545*height), control1: CGPoint(x: 0.63159*width, y: 0.65066*height), control2: CGPoint(x: 0.72377*width, y: 0.58305*height))
        path.addCurve(to: CGPoint(x: 0.62329*width, y: 0.49917*height), control1: CGPoint(x: 0.74523*width, y: 0.52847*height), control2: CGPoint(x: 0.70719*width, y: 0.52784*height))
        path.addCurve(to: CGPoint(x: 0.47894*width, y: 0.41743*height), control1: CGPoint(x: 0.53259*width, y: 0.46502*height), control2: CGPoint(x: 0.51405*width, y: 0.4409*height))
        path.addCurve(to: CGPoint(x: 0.44779*width, y: 0.5108*height), control1: CGPoint(x: 0.47894*width, y: 0.42377*height), control2: CGPoint(x: 0.46877*width, y: 0.47722*height))
        path.addCurve(to: CGPoint(x: 0.36502*width, y: 0.5862*height), control1: CGPoint(x: 0.42687*width, y: 0.54427*height), control2: CGPoint(x: 0.36502*width, y: 0.5862*height))
        path.addCurve(to: CGPoint(x: 0.21828*width, y: 0.69838*height), control1: CGPoint(x: 0.36502*width, y: 0.5862*height), control2: CGPoint(x: 0.25092*width, y: 0.67078*height))
        path.addCurve(to: CGPoint(x: 0, y: height), control1: CGPoint(x: 0.1005*width, y: 0.79794*height), control2: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0.75917*width, y: height))
        path.addLine(to: CGPoint(x: 0.69269*width, y: 0.89015*height))
        path.addLine(to: CGPoint(x: 0.60104*width, y: 0.78252*height))
        path.addCurve(to: CGPoint(x: 0.60825*width, y: 0.73909*height), control1: CGPoint(x: 0.60104*width, y: 0.78252*height), control2: CGPoint(x: 0.60435*width, y: 0.75387*height))
        path.closeSubpath()
        return path
    }
}
