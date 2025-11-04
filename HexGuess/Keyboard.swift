//
//  Keyboard.swift
//  HexGuess
//
//  Created by Sharon Moon on 11/3/25.
//

import SwiftUI
import CoreGraphics

struct Keyboard: View {
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Cell(key: "0")
                Cell(key: "1")
                Cell(key: "2")
                Cell(key: "3")
                Cell(key: "4")
                Cell(key: "<-")
            }
            .frame(width: 360)
            HStack{
                Cell(key: "5")
                Cell(key: "6")
                Cell(key: "7")
                Cell(key: "8")
                Cell(key: "9")
            }
            .frame(width: 300)
            HStack{
                Cell(key: "A")
                Cell(key: "B")
                Cell(key: "C")
                Cell(key: "D")
                Cell(key: "E")
                Cell(key: "F")
            }
            .frame(width: 360)
        }
        .frame(height: 180)
    }
}

struct Cell: View {
    var key: String
    var body: some View {
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
#Preview {
    Keyboard()
}

