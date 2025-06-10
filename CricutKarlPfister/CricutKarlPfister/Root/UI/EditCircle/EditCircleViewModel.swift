//
//  EditCircleViewModel.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI
final class EditCircleViewModel: ObservableObject {
  
  @ObservedObject var gridViewModel: GridViewModel
  
  
  init(gridViewModel: GridViewModel) {
    self.gridViewModel = gridViewModel
  }
  
  func removeCircle() {
    guard let index = gridViewModel.shapes.lastIndex(where: {$0.shape == .circle}) else { return }
    gridViewModel.shapes.remove(at: index)
  }
  
  func addCircle() {
    gridViewModel.shapes.append(CustomShape(shape: .circle))
  }
  
  func removeAllCircles() {
    gridViewModel.shapes.removeAll(where: {$0.shape == .circle })
  }
  
}
