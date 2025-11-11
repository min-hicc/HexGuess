//
//  Play.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/4/25.
//
import SwiftUI
func buildRandom() -> String {
    let hexList: [String] = ["1", "2", "3", "4", "5", "6", "7" , "8", "9", "A", "B", "C", "D", "E", "f"]
    return hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()! + hexList.randomElement()!
}

struct Play: View {
    @State private var isPlaying = false
    let randomColor = buildRandom()

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
        if isPlaying {
            ContentView(hexToGuess: randomColor)
        }
//        if isPlaying {
//            ContentView()
//
//            GeometryReader { geometry in
//                ZStack{
//                    Button(action: {isPlaying.toggle()}) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(.white)
//                                .frame(width: 70, height: 30)
//                            Text("back")
////                                .color(Color.brown)
//                        }
//                    }
////                    .position(x: (geometry.size.width - 70), y: 20)
//                }
//            }
//        }
    }
}


#Preview {
    Play()
}
