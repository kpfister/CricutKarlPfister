//
//  EditCircleView.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

struct EditCircleView: View {
  @ObservedObject private var viewModel: EditCircleViewModel
  
  init(viewModel: EditCircleViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    VStack(spacing: .zero) {
      ScrollView {
        LazyVGrid(columns: gridItems) {
          ForEach(viewModel.gridViewModel.shapes.filter {$0.shape == .circle} ) { shape in
            Circle()
          }
        }
      }
      
      buttonsView
        .padding()
    }
  }
  
  private var buttonsView: some View {
    HStack {
      Button("Delete All") {
        viewModel.removeAllCircles()
      }
      
      Spacer()
      
      Button("Add") {
        viewModel.addCircle()
      }
      
      Spacer()
      
      Button("Remove") {
        viewModel.removeCircle()
      }
    }
  }
}

#Preview {
  EditCircleView(
    viewModel: EditCircleViewModel(
      gridViewModel: GridViewModel()
    )
  )
}
