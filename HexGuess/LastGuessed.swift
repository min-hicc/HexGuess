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
    
    @Binding var textColor: Color

    var body: some View {
        VStack(spacing: 10){
            if !lastGuessStr1.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr1), text: "#" + lastGuessStr1, textColor: textColor)
            }
            if !lastGuessStr2.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr2), text: "#" + lastGuessStr2, textColor: textColor)
            }
            if !lastGuessStr3.isEmpty {
                LastGuessedCell(color: Color(hex: lastGuessStr3), text: "#" + lastGuessStr3, textColor: textColor)
            }
        }
    }
}

struct LastGuessedCell: View {
    var color: Color
    var text: String
    var textColor: Color
    var body: some View {
        ZStack {
            HStack {
                Text("\(text)")
                    .foregroundStyle(textColor)
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .stroke(.white, lineWidth: 5)
                    .frame(width: 50, height: 50)
                
            }
            .frame(width: 140)
        }
    }
    
}

#Preview{
//    LastGuessedCell(color: Color(.brown), text: "#" + "DDBBE0")

}

