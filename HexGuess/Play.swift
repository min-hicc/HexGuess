//
//  Play.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/4/25.
//
import SwiftUI
func buildRandom() -> String {
    let hexList: [String] = ["1", "2", "3", "4", "5", "6", "7" , "8", "9", "A", "B", "C", "D", "E", "F"]
    let ret = hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()!
    print(ret)

    return ret
//    return "FFFFFF"
    
}

struct Play: View {
    @State private var isPlaying = false
    @State private var randomColor = buildRandom()
    @State private var win = false
    
    @State private var hint: Int = 0

    
    var body: some View {
        if !isPlaying {
            ZStack {
                Color(hex: randomColor)
                    .ignoresSafeArea()
                VStack {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color(.white))
//                        Text("Welcome to Hex Guess!")
//                            .font(.title)
//                            .foregroundStyle(Color(hex: randomColor))
//                    }
//                    .frame(width: 350, height: 80)
//                    

                    Button("Start Game") {
                        isPlaying.toggle()  // Switch to the game screen
                    }
                    .font(.title2)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color(hex: randomColor))
                    .cornerRadius(10)
                    
                }
//                .padding()
            }
        }
        if isPlaying && !win {
            ZStack{
                ContentView(hexToGuess: randomColor, win: $win, hint: $hint)

                Button(action: {
                    isPlaying.toggle()
                    randomColor = buildRandom()
                    hint = 0
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .fill(Color(hex: randomColor))
                        Text("back")
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 70, height: 30)
                .position(x: 50, y: 10)
            }
        }
        else if win {
            ZStack {
                Color(hex: randomColor)
                    .ignoresSafeArea()
                VStack {
                    Text("You won!")
                        .font(.title)
                        .padding()
                    
                    //add a stats text
                    // hints used: 0
                    // tries: 0
                    // time : 00:00
                    
                    Button("Play Again") {
                        isPlaying = true  // Switch to the new screen
                        win = false
                        hint = 0
                        randomColor = buildRandom()
                    }
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
            }
        }
    }
}


#Preview {
    Play()
}
