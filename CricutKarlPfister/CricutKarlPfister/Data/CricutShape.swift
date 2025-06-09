//
//  CrucutShape.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation

struct CricutShapeTopLevel: Decodable, Hashable {
  let buttons: [CricutShape]
}

struct CricutShape: Decodable, Hashable {
  let name: String
  let drawPath: String
}

