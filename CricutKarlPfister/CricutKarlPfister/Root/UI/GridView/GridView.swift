//
//  GridView.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

struct GridView: View {
  
  @StateObject var viewModel = GridViewModel()
  @State private var showEditCircles = false

  var body: some View {
    NavigationStack {
      VStack(spacing: .zero) {
        ScrollView {
          gridView
        }
        .padding()
        
        buttonsView
          .padding()
        
      }
      .sheet(isPresented: $viewModel.isShowingAlertCover) {
        AlertModalView(viewModel: viewModel)
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Clear All") {
            viewModel.removeAllShapes()
          }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Edit Circles") {
            showEditCircles = true
          }
          .navigationDestination(isPresented: $showEditCircles) {
            EditCircleView(
              viewModel: EditCircleViewModel(gridViewModel: viewModel))
          }
        }
        
      }
    }
    .task {
      await viewModel.fetchButtons()
    }
  }
  
  private var gridView: some View {
    
    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    
    return LazyVGrid(columns: gridItems) {
      ForEach(viewModel.shapes) { shape in
        switch shape.shape {
        case .circle:
          Circle()
        case .square:
          Rectangle()
            .aspectRatio(1.0, contentMode: .fit)
        case .triangle:
          Triangle()
            .frame(width: 100, height: 100)
        }
      }
    }
  }
  
  private var buttonsView: some View {
    HStack(alignment: .center) {
      ForEach(viewModel.buttons ?? [], id: \.self) { button in
        Button(button.name) {
          viewModel.addShape(ofType: button.name)
        }
      }
    }
  }

}

#Preview {
  GridView()
}
