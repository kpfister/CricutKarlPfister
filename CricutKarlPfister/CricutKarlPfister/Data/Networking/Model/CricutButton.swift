//
//  CrucutButton.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation

struct CricutButtonTopLevel: Decodable, Hashable {
  let buttons: [CricutButton]
}

struct CricutButton: Decodable, Hashable {
  let name: String
  let drawPath: String
}

