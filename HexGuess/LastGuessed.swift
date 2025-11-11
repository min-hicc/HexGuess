//
//  LastGuessed.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/4/25.
//
import SwiftUI

struct LastGuessed: View {
    @Binding var lastGuessStr1: String
    @Binding var lastGuessStr2: String
    @Binding var lastGuessStr3: String
    
    

    var body: some View {
        VStack(spacing: 10){
            if !lastGuessStr1.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr1), text: "#" + lastGuessStr1)
            }
            if !lastGuessStr2.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr2), text: "#" + lastGuessStr2)
            }
            if !lastGuessStr3.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr3), text: "#" + lastGuessStr3)
            }
        }
    }
}

struct LastGuessedCell: View {
    var color: Color
    var text: String
    var body: some View {
        HStack {
            Text("\(text)")
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .stroke(.white, lineWidth: 6)
                .frame(width: 50, height: 50)
            
        }
    }
    
}

#Preview{LastGuessedCell(color: Color(.brown), text: "#" + "ff00ff")}

