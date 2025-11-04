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
        VStack{
            // a -
            HStack{
                Cell()
                Cell()
                Cell()
                Cell()
                Cell()
                Cell()
            }
            HStack{
                Cell()
                Cell()
                Cell()
                Cell()
                Cell()
            }
            HStack{
                Cell()
                Cell()
                Cell()
                Cell()
                Cell()
                Cell()
            }
//            .padding()
        }
//        .padding()
        .frame(width: 360, height: 200)
    }
}

struct Cell: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
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
//            .background(.green)
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

