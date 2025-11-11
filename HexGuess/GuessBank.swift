//
//  GuessBank.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/4/25.
//

import SwiftUI

struct GuessBank: View {
    @Binding var guess1: String
    @Binding var guess2: String
    @Binding var guess3: String
    @Binding var guess4: String
    @Binding var guess5: String
    @Binding var guess6: String
    
    @Binding var textColor: Color
    @Binding var hint: Int
    @Binding var correctGuess: String
    
    var body: some View {
        HStack {
            Text("#")
                .font(.title)
                .foregroundStyle(textColor)
            if hint >= 1 && guess1.isEmpty {
                GuessCell(letter: guess1, correctGuess: String(correctGuess.prefix(1)))
            }
            else {
                GuessCell(letter: guess1, correctGuess: "")
            }
            
            if hint >= 4 && guess2.isEmpty {
                GuessCell(letter: guess2, correctGuess: String(correctGuess.dropFirst(1).prefix(1)))
            }
            else {
                GuessCell(letter: guess2, correctGuess: "")
            }
            
            if hint >= 2 && guess3.isEmpty {
                GuessCell(letter: guess3, correctGuess: String(correctGuess.dropFirst(2).prefix(1)))
            }
            else {
                GuessCell(letter: guess3, correctGuess: "")
            }
            
            if hint >= 5 && guess4.isEmpty {
                GuessCell(letter: guess4, correctGuess: String(correctGuess.dropFirst(3).prefix(1)))
            }
            else {
                GuessCell(letter: guess4, correctGuess: "")
            }
            
            if hint >= 3 && guess5.isEmpty {
                GuessCell(letter: guess5, correctGuess: String(correctGuess.dropFirst(4).prefix(1)))
            }
            else {
                GuessCell(letter: guess5, correctGuess: "")
            }
            
            if hint >= 6 && guess6.isEmpty {
                GuessCell(letter: guess6, correctGuess: String(correctGuess.dropFirst(5).prefix(1)))
            }
            else {
                GuessCell(letter: guess6, correctGuess: "")
            }
            
        }
    }
}

struct GuessCell: View {
    var letter: String
    var correctGuess: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
                .fill(.white)
                .frame(width: 50, height: 50)
            Text("\(correctGuess)")
                .foregroundStyle(Color(.lightGray))
            Text("\(letter)")
        }
    }
}

//#Preview {
//    GuessBank(guess1: <#Binding<String>#>, guess2: <#Binding<String>#>, guess3: <#Binding<String>#>, guess4: <#Binding<String>#>, guess5: <#Binding<String>#>, guess6: <#Binding<String>#>)
//}
//
