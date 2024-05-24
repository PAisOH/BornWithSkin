//
//  File.swift
//  
//
//  Created by Euan on 2024/2/22.
//

import SwiftUI

struct InquiryFaceView: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    
    
    @State var selectedName = ""
    
    var body: some View {
        VStack {
            Text((globalVariables.skinType.isEmpty ? "What's my skin type?" : "Current skin type: " + globalVariables.skinType))
                .font(.title)
                .bold()
                .padding()
            
            RadioButtonGroup(items: [
                ("Normal", "Normal skin is defined as neither oily nor dry, soft and smooth, without blemishes, with a healthy complexion, and almost invisible pores."),
                ("Oily", "Oily skin is defined as having a noticeable shine due to increased sebum and oil secretion. It typically has enlarged pores, a rough texture, shows imperfections, and is prone to blackheads and acne."),
                ("Dry", "Dry skin is defined as lacking brightness, appearing dull, redness-prone, often flaky, with barely visible pores, and overall lacking elasticity."),
                ("Combination", "Combination skin is defined as having oily skin in certain areas and normal or dry skin in other areas. This is the most common skin type. The oily areas are typically in the T-zone (forehead, nose, and chin)."),
                ("Sensitive", "Sensitive skin refers to skin that is easily irritated by weather, environmental factors, or topical products. It often appears red, dry, and may feel itchy, burning, or stingy.")],
                             selectedId: selectedName) { selected in
                print("Selected is: \(selected)")
                selectedName = selected
            }
            .padding()
            
            Button(action: {
                if !selectedName.isEmpty {
                    UserDefaults.standard.set(selectedName, forKey: "skinType")
                    globalVariables.skinType = selectedName
                    
                    if globalVariables.isFirstLaunch == false {
                        print(":::isFirstLaunch: \(globalVariables.isFirstLaunch)")
                        print("```isFirstLaunch: \( UserDefaults.standard.bool(forKey: "isFirstLaunch"))")
                        globalVariables.isFirstLaunch = true
                        UserDefaults.standard.set(true, forKey: "isFirstLaunch")
                        UserDefaults.standard.set(true, forKey: "isFirstLaunch")
//                        UserDefaults.standard.set(true, forKey: "launchCount")
                    }
                }
            }, label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    
                    Text("Confirm")
                        .bold()
                    
                }
//                .foregroundColor()
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .modifier(ColorInvert())
//                .background(
//                    RoundedRectangle(cornerRadius: 8)
//                        .foregroundColor(Color.indigo)
//                    
//                )
//                .compositingGroup()
//                .shadow(radius: 5,x:0,y:3)
//                .contentShape(Rectangle())
            })
            .buttonStyle(.borderedProminent)
            .padding()
            
            
            Text("Note: No two skin types are the same, and the above classifications are common categories set by skincare product manufacturers when developing products for specific target users. So, you may not fit 100% into one specific type. Choose the one that best suits you.")
                .padding()
                .foregroundStyle(.secondary)
        }
//        .aspectRatio(1.5, contentMode: .fit)
        .frame(minWidth: 150, maxWidth: 800)
        
    }
}

struct RadioButton: View {

    @Environment(\.colorScheme) var colorScheme

    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    var description: String

    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary,
        textSize: CGFloat = 18,
        description: String
    ) {
        self.id = id
        self.size = size
        self.color = selectedID == id ? .accentColor : color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
        self.description = description
    }

    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.size, height: self.size)
                    //                    .modifier(ColorInvert())
                    Text(id)
                    
                        .font(Font.system(size: textSize))
                        .bold()
                    
                }
                Text(description)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
                    .lineLimit(5)

            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}

struct RadioButtonGroup: View {

    let items : [(name: String, description: String)]

    @State var selectedId: String = ""

    let callback: (String) -> ()

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index].name, callback: self.radioGroupCallback, selectedID: self.selectedId, description: self.items[index].description)
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
