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
    
    var body: some View {
        HStack {
            Text("#")
                .font(.title)
            GuessCell(letter: guess1)
            GuessCell(letter: guess2)
            GuessCell(letter: guess3)
            GuessCell(letter: guess4)
            GuessCell(letter: guess5)
            GuessCell(letter: guess6)
    
        }
    }
}

struct GuessCell: View {
    var letter: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black)
                .fill(.white)
                .frame(width: 50, height: 50)
            Text("\(letter)")
        }
    }
}

//#Preview {
//    GuessBank(guess1: <#Binding<String>#>, guess2: <#Binding<String>#>, guess3: <#Binding<String>#>, guess4: <#Binding<String>#>, guess5: <#Binding<String>#>, guess6: <#Binding<String>#>)
//}
//
