//
//  CricutGridViewModel.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

final class GridViewModel: ObservableObject {
  
  @Published var buttons: [CricutButton]?
  @Published var shapes: [CustomShape] = []
  @Published var isShowingAlertCover = false
  @Published var errorMessage: String?
  @Published var isLoading = false
  @Published var isFetchError = false
  
  private let service: ButtonAPIProvidable
  
  init(service: ButtonAPIProvidable = ButtonAPIProvider()) {
    self.service = service
  }
  
  @MainActor
  func fetchButtons() async {
    isLoading = true
    
    defer { isLoading = false }
    
    do {
      self.buttons = try await service.getButtons()
    } catch {
      isFetchError = true
      errorMessage = "Oh no! Something went wrong. Please try again"
      isShowingAlertCover = true
    }
  }
  
  func addShape(ofType shape: String) {
    guard let shape = CricutShape(rawValue: shape.lowercased()) else {
      errorMessage = "Oh no! We were unable to add that shape. Please try again"
      isShowingAlertCover = true
      return
    }
    shapes.append(CustomShape(shape: shape))
  }
  
  func removeAllShapes() {
    shapes = []
  }
  
}
