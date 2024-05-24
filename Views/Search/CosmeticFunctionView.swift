//
//  File.swift
//  
//
//  Created by Euan on 2024/2/18.
//

import SwiftUI

struct CosmeticFunctionView: View {
    
    var cosmetic: CosmeticCoreDataModel

    var body: some View {
        HStack(spacing: -6) {
            
            if cosmetic.inCleanser {
                Circle()
                    .fill(cosmetic.inCleanser ? Color.green.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
            if cosmetic.inMoist {
                ZStack {
                    Circle()
                        .fill(cosmetic.inMoist ? Color.blue.opacity(0.7) : Color.clear)
                        .frame(height: 20)
                }
            }
            if cosmetic.inSuncreen {
                Circle()
                    .fill(cosmetic.inSuncreen ? Color.orange.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
            if cosmetic.inBrighten {
                Circle()
                    .fill(cosmetic.inBrighten ? Color.gray.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
            if cosmetic.inAcne {
                Circle()
                    .fill(cosmetic.inAcne ? Color.red.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
            if cosmetic.inRepair {
                Circle()
                    .fill(cosmetic.inRepair ? Color.yellow.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
            if cosmetic.inAntiAging {
                Circle()
                    .fill(cosmetic.inAntiAging ? Color.purple.opacity(0.7) : Color.clear)
                    .frame(height: 20)
            }
        }
    }
    
    
    static func illustrationView() -> some View {
        VStack(alignment: .leading) {
            Text("Illustration of [Efficacy]")
                .bold()
            
            HStack {
                Circle()
                    .fill(Color.green.opacity(0.7))
                    .frame(height: 20)
                Text("Clean")
            }
            
            HStack {
                Circle()
                    .fill(Color.blue.opacity(0.7))
                    .frame(height: 20)
                Text("Moist")
            }
            
            HStack {
                Circle()
                    .fill(Color.orange.opacity(0.7))
                    .frame(height: 20)
                Text("Suncreen")
            }
                
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.7))
                    .frame(height: 20)
                Text("Brighten")
            }
                
            HStack {
                Circle()
                    .fill(Color.red.opacity(0.7))
                    .frame(height: 20)
                Text("Brighten")
            }
                
            HStack {
                Circle()
                    .fill(Color.yellow.opacity(0.7))
                    .frame(height: 20)
                Text("Repair")
            }

            HStack {
                Circle()
                    .fill(Color.purple.opacity(0.7))
                    .frame(height: 20)
                Text("Anti-aging")
            }
        }
    }
}
