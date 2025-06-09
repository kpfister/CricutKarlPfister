//
//  CricutTriangle.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//
import SwiftUI

struct Triangle: Shape {
   
    func path(in rect: CGRect) -> Path {
        Path { path in
            // .move sets the starting point of the path.
            // Starting Point: Middle of the top edge
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            // First Line: From the starting point to the bottom right corner
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            // Second Line: From the bottom right corner to the bottom left corner (rect.minX, rect.maxY)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            // Closing the Path: Draws the final line from the bottom left corner back to the starting point, forming a closed triangular shape
            path.closeSubpath()
        }
    }
}
