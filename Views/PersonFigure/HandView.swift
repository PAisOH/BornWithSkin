//
//  File.swift
//  
//
//  Created by Euan on 2024/2/21.
//

import SwiftUI

struct HandView: View {
    private let aspectRatioHand: CGFloat = 679 / 304

    var body: some View {
        ZStack {
            Finger1()
                .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
            Finger3()
                .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
            Finger4()
                .fill(Gradient(colors: [.white, .black]).shadow(.inner(radius: 20)))
            Finger5()
                .fill(Gradient(colors: [.gray, .black]).shadow(.inner(radius: 20)))
        }
        .aspectRatio(aspectRatioHand, contentMode: .fit)
    }
}


struct Finger5: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.98517*width, y: 0.16215*height))
        path.addLine(to: CGPoint(x: 0.88073*width, y: 0.0023*height))
        path.addLine(to: CGPoint(x: 0.54846*width, y: 0.24022*height))
        path.addLine(to: CGPoint(x: -0.05271*width, y: 0.99747*height))
        path.addLine(to: CGPoint(x: 0.27592*width, y: 0.99746*height))
        path.addLine(to: CGPoint(x: 0.58651*width, y: 0.40337*height))
        path.addCurve(to: CGPoint(x: 0.67983*width, y: 0.4206*height), control1: CGPoint(x: 0.58651*width, y: 0.40337*height), control2: CGPoint(x: 0.64714*width, y: 0.45521*height))
        path.addCurve(to: CGPoint(x: 0.80859*width, y: 0.13801*height), control1: CGPoint(x: 0.74726*width, y: 0.34923*height), control2: CGPoint(x: 0.80859*width, y: 0.13801*height))
        path.addLine(to: CGPoint(x: 0.8729*width, y: 0.08011*height))
        path.addLine(to: CGPoint(x: 0.93561*width, y: 0.16605*height))
        path.addCurve(to: CGPoint(x: 0.95659*width, y: 0.17808*height), control1: CGPoint(x: 0.93561*width, y: 0.16605*height), control2: CGPoint(x: 0.94811*width, y: 0.17729*height))
        path.addCurve(to: CGPoint(x: 0.98517*width, y: 0.16215*height), control1: CGPoint(x: 0.96812*width, y: 0.17916*height), control2: CGPoint(x: 0.98517*width, y: 0.16215*height))
        path.closeSubpath()
        return path
    }
}

struct Finger4: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.83628*width, y: 0.2219*height))
        path.addLine(to: CGPoint(x: 0.75105*width, y: 0.28254*height))
        path.addLine(to: CGPoint(x: 0.79934*width, y: 0.10204*height))
        path.addLine(to: CGPoint(x: 0.90993*width, y: 0.2165*height))
        path.addLine(to: CGPoint(x: 0.84796*width, y: 0.48606*height))
        path.addCurve(to: CGPoint(x: 0.83267*width, y: 0.42462*height), control1: CGPoint(x: 0.84796*width, y: 0.48606*height), control2: CGPoint(x: 0.83342*width, y: 0.4517*height))
        path.addCurve(to: CGPoint(x: 0.83657*width, y: 0.38304*height), control1: CGPoint(x: 0.83221*width, y: 0.40809*height), control2: CGPoint(x: 0.83657*width, y: 0.38304*height))
        path.addLine(to: CGPoint(x: 0.86096*width, y: 0.24744*height))
        path.addLine(to: CGPoint(x: 0.83628*width, y: 0.2219*height))
        path.closeSubpath()
        return path
    }
}

struct Finger3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.82805*width, y: 0.21338*height))
        path.addLine(to: CGPoint(x: 0.7062*width, y: 0.32014*height))
        path.addLine(to: CGPoint(x: 0.80939*width, y: 0.11245*height))
        path.addLine(to: CGPoint(x: 0.93918*width, y: 0.24677*height))
        path.addLine(to: CGPoint(x: 0.87721*width, y: 0.51633*height))
        path.addCurve(to: CGPoint(x: 0.86192*width, y: 0.45489*height), control1: CGPoint(x: 0.87721*width, y: 0.51633*height), control2: CGPoint(x: 0.86267*width, y: 0.48197*height))
        path.addCurve(to: CGPoint(x: 0.86582*width, y: 0.41331*height), control1: CGPoint(x: 0.86146*width, y: 0.43836*height), control2: CGPoint(x: 0.86582*width, y: 0.41331*height))
        path.addLine(to: CGPoint(x: 0.89386*width, y: 0.28149*height))
        path.addLine(to: CGPoint(x: 0.82805*width, y: 0.21338*height))
        path.closeSubpath()
        return path
    }
}

struct Finger1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.82868*width, y: 0.65786*height))
        path.addLine(to: CGPoint(x: 0.56993*width, y: 0.38245*height))
        path.addLine(to: CGPoint(x: 0.81118*width, y: 0.11398*height))
        path.addLine(to: CGPoint(x: 0.98366*width, y: 0.29276*height))
        path.addLine(to: CGPoint(x: 0.99857*width, y: 0.57229*height))
        path.addLine(to: CGPoint(x: 0.96928*width, y: 0.52272*height))
        path.addLine(to: CGPoint(x: 0.95116*width, y: 0.33589*height))
        path.addLine(to: CGPoint(x: 0.8705*width, y: 0.27389*height))
        path.addLine(to: CGPoint(x: 0.71164*width, y: 0.39011*height))
        path.addCurve(to: CGPoint(x: 0.76119*width, y: 0.49908*height), control1: CGPoint(x: 0.71164*width, y: 0.39011*height), control2: CGPoint(x: 0.73164*width, y: 0.44572*height))
        path.addCurve(to: CGPoint(x: 0.81561*width, y: 0.5819*height), control1: CGPoint(x: 0.78068*width, y: 0.53428*height), control2: CGPoint(x: 0.80726*width, y: 0.55293*height))
        path.addCurve(to: CGPoint(x: 0.82868*width, y: 0.65786*height), control1: CGPoint(x: 0.82396*width, y: 0.61087*height), control2: CGPoint(x: 0.82868*width, y: 0.65786*height))
        path.closeSubpath()
        return path
    }
}
