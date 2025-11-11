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
                    Text("Welcome to Hex Guess!")
                        .font(.title)
                        .padding()
                    
                    Button("Start Game") {
                        isPlaying.toggle()  // Switch to the game screen
                    }
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
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
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        Text("back")
                    }
                }
                .frame(width: 70, height: 20)
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
                    
                    Button("Play Again") {
                        isPlaying.toggle()  // Switch to the play screen
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
//                .padding()
            }
        }
    }
}


#Preview {
    Play()
}
