//
//  CrucutShape.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation

struct CricutShapeTopLevel: Decodable {
  let buttons: [CricutShape]
}

struct CricutShape: Decodable {
  let name: String
  let drawPath: String
}

