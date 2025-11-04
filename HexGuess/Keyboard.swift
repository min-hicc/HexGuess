//
//  Keyboard.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/3/25.
//

import SwiftUI
import CoreGraphics

struct Keyboard: View {
    var clicked: (String) -> Void
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Cell(key: "0", clicked: clicked)
                Cell(key: "1", clicked: clicked)
                Cell(key: "2", clicked: clicked)
                Cell(key: "3", clicked: clicked)
                Cell(key: "4", clicked: clicked)
                Cell(key: "<-", clicked: clicked)
            }
            .frame(width: 360)
            HStack{
                Cell(key: "5", clicked: clicked)
                Cell(key: "6", clicked: clicked)
                Cell(key: "7", clicked: clicked)
                Cell(key: "8", clicked: clicked)
                Cell(key: "9", clicked: clicked)
            }
            .frame(width: 300)
            HStack{
                Cell(key: "A", clicked: clicked)
                Cell(key: "B", clicked: clicked)
                Cell(key: "C", clicked: clicked)
                Cell(key: "D", clicked: clicked)
                Cell(key: "E", clicked: clicked)
                Cell(key: "F", clicked: clicked)
            }
            .frame(width: 360)
        }
        .frame(height: 180)
    }
}


struct Cell: View {
    var key: String
    var clicked: (String) -> Void
    var body: some View {
        Button(action: {clicked(key)}) {
            GeometryReader { geometry in
                ZStack{
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    
                    Path { path in
                        let width = width
                        let height = width
                        
                        path.move(
                            to: CGPoint(
                                x: width * 0.95,
                                y: height * 0.20
                            )
                        )
                        HexParams.segments.forEach { segment in
                            path.addLine(to: CGPoint(
                                x: width * segment.line.x,
                                y: height * segment.line.y
                            ))
                            
                            path.addQuadCurve(to: CGPoint(
                                x: width * segment.curve.x,
                                y: height * segment.curve.y
                            ), control: CGPoint(
                                x: width * segment.control.x,
                                y: height * segment.control.y
                            ))
                        }
                    }
                    .stroke(.black)
                    .fill(.white)
                    .frame(height: width)
                    Text("\(key)")
                    
                }
            }
        }
    }
}

struct HexParams {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let segments = [
        Segment(
            line: CGPoint(x: 0.60, y: 0.05),
                
            curve:  CGPoint(x: 0.40, y: 0.05),
                
            control: CGPoint(x: 0.50, y: 0.00)
        ),

        Segment(

            line:    CGPoint(x: 0.05, y: 0.20),

            curve:   CGPoint(x: 0.00, y: 0.30),

            control: CGPoint(x: 0.00, y: 0.25)

        ),

        Segment(

            line:    CGPoint(x: 0.00, y: 0.70),

            curve:   CGPoint(x: 0.05, y: 0.80),

            control: CGPoint(x: 0.00, y: 0.75)

        ),

        Segment(

            line:    CGPoint(x: 0.40, y: 0.95),

            curve:   CGPoint(x: 0.60, y: 0.95),

            control: CGPoint(x: 0.50, y: 1.00)

        ),

        Segment(

            line:    CGPoint(x: 0.95, y: 0.80),

            curve:   CGPoint(x: 1.00, y: 0.70),

            control: CGPoint(x: 1.00, y: 0.75)

        ),

        Segment(

            line:    CGPoint(x: 1.00, y: 0.30),

            curve:   CGPoint(x: 0.95, y: 0.20),

            control: CGPoint(x: 1.00, y: 0.25)

        )
    ]

    
}
//#Preview {
//    Keyboard(clicked: clicke)
//}
//
