//
//  ContentView.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/3/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        guard cleanedHex.count == 6 else {
            self = .gray
            print("Invalid hex code: \(hex)")
            return
        }
        
        let rStr = String(cleanedHex.prefix(2))
        let gStr = String(cleanedHex.dropFirst(2).prefix(2))
        let bStr = String(cleanedHex.dropFirst(4).prefix(2))
        
        let r = UInt8(rStr, radix: 16) ?? 0
        let g = UInt8(gStr, radix: 16) ?? 0
        let b = UInt8(bStr, radix: 16) ?? 0
        //        print("RGB = (\(r), \(g), \(b))")
        
        self.init(red: Double(r) / 255.0,
                  green: Double(g) / 255.0,
                  blue: Double(b) / 255.0)
    }
}

struct ContentView: View {
    @State private var hexCode: String = ""
    var body: some View {
        ZStack{
            Color(hex: hexCode)
                .ignoresSafeArea()
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(.white)
                .frame(width: 250, height: 200)
                
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                TextField("FFFFFF", text: $hexCode)
                    .frame(width: 60)
            }
        }
    }
}

#Preview {
    ContentView()
}
