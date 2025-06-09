//
//  CricutGridViewModel.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

final class CricutGridViewModel: ObservableObject {
  
  @Published var buttons: [CricutShape]?
  @Published var shapes: [CustomShape] = []
  
  private let service: ButtonAPIProvidable
  
  init(service: ButtonAPIProvidable = ButtonAPIProvider()) {
    self.service = service
  }
  
  @MainActor
  func fetchButtons() async {
    do {
      self.buttons = try await service.getButtons()
    } catch let error {
      // Present error
      print("ERROR: Error fetching from viewmodel. \(error)")
    }
  }
  
  func addShape(ofType shape: String) {
    let shaped = CricutCustomShape(from: shape)
    shapes.append(CustomShape(shape: shaped!))
  }
  
  func removeAllShapes() {
    shapes = []
  }
}


enum CricutCustomShape {
  case Circle
  case Square
  case Triangle
  
  init?(from title: String) {
    switch title.lowercased() {
    case "circle": self = .Circle
    case "square": self = .Square
    case "triangle": self = .Triangle
    default: return nil
    }
  }
}

struct CustomShape: Identifiable {
  let id = UUID()
  var shape: CricutCustomShape
}
