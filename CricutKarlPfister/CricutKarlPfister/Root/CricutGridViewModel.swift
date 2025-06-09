//
//  CricutGridViewModel.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

final class CricutGridViewModel: ObservableObject {
  
  @Published var buttons: [CricutShape]?
  
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
  

}
