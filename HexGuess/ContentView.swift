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
    let hexToGuess: String
    @State private var hexCode: String = ""
    @State private var bgHexCode: String = ""
    
    @State private var guess1: String = ""
    @State private var guess2: String = ""
    @State private var guess3: String = ""
    @State private var guess4: String = ""
    @State private var guess5: String = ""
    @State private var guess6: String = ""
    
    @State private var lastGuessStr1: String = ""
    @State private var lastGuessStr2: String = ""
    @State private var lastGuessStr3: String = ""
    
    @State private var textColor: Color = .black

    
    func clicked(key: String) {
        
        if key == "<-" {
            if hexCode.count > 0 {
                hexCode = String(hexCode.dropLast())
            }
            if !guess6.isEmpty {
                guess6 = ""
            } else if !guess5.isEmpty {
                guess5 = ""
            } else if !guess4.isEmpty {
                guess4 = ""
            } else if !guess3.isEmpty {
                guess3 = ""
            } else if !guess2.isEmpty {
                guess2 = ""
            } else if !guess1.isEmpty {
                guess1 = ""
            }
        }
        else {
            if hexCode.count < 6 {
                hexCode += key
            }
            if guess1.isEmpty {
                guess1 = key
            } else if guess2.isEmpty {
                guess2 = key
            } else if guess3.isEmpty {
                guess3 = key
            } else if guess4.isEmpty {
                guess4 = key
            } else if guess5.isEmpty {
                guess5 = key
            } else if guess6.isEmpty {
                guess6 = key
            }
        }
    }
    func checkTemp() -> Bool {
        let rStr = String(hexCode.prefix(2))
        let gStr = String(hexCode.dropFirst(2).prefix(2))
        let bStr = String(hexCode.dropFirst(4).prefix(2))
        print(rStr + gStr + bStr)
        
        let r = UInt8(rStr, radix: 16) ?? 0
        let g = UInt8(gStr, radix: 16) ?? 0
        let b = UInt8(bStr, radix: 16) ?? 0
        print(Double(r)+Double(g)+Double(b))
        
        return Double(r)+Double(g)+Double(b) < 210
        
    }
    
    func enter() {
//        let temp = lastGuessStr3
        if hexCode.count == 6 {
            
            bgHexCode = hexCode
            if checkTemp() {
                textColor = Color(.white)
            }
            else{
                textColor = Color(.black)
            }
            
            lastGuessStr1 = lastGuessStr2
            lastGuessStr2 = lastGuessStr3
            lastGuessStr3 = hexCode
            
            hexCode = ""
            guess1 = ""
            guess2 = ""
            guess3 = ""
            guess4 = ""
            guess5 = ""
            guess6 = ""
            
        }
        
        
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                Color(hex: bgHexCode)
                    .ignoresSafeArea()
                VStack{
                    Spacer(minLength: 50)
                    HStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(hex: hexToGuess))
                            .frame(width: 200, height:200)
                            .position(x: 120, y: 150 )
                        LastGuessed(lastGuessStr1: $lastGuessStr1, lastGuessStr2: $lastGuessStr2, lastGuessStr3: $lastGuessStr3, textColor: $textColor)
                            .position(x: geometry.size.width/4, y: 150)
                        
                    }
                    Spacer(minLength: 180)
                    GuessBank(guess1: $guess1, guess2: $guess2, guess3: $guess3, guess4: $guess4, guess5: $guess5, guess6: $guess6, textColor: $textColor)
                        .position(x: geometry.size.width / 2, y: geometry.size.height/10)
                    Spacer(minLength: 40)
                    Button(action: {enter()}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.black)
                            Text("enter")
                        }
                    }
                    .frame(width: 100, height: 50)
                    .position(x: geometry.size.width / 2, y: 0)
                    


                    Keyboard(clicked: clicked)
                }
            }
        }
    }
}

#Preview {
    ContentView(hexToGuess: "FF0000")
}
