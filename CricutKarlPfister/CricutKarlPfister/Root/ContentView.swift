//
//  ContentView.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel = CricutGridViewModel()
  
  var body: some View {
    NavigationStack {
      GeometryReader { geo in
        let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
        VStack(spacing: .zero) {
          ScrollView {
            LazyVGrid(columns: gridItems) {
              ForEach(viewModel.shapes) { shape in
                switch shape.shape {
                case .Circle:
                  Circle()
                case .Square:
                  Rectangle()
                    .aspectRatio(1.0, contentMode: .fit)
                    .foregroundStyle(.teal)
                case .Triangle:
                 Triangle()
                    .frame(width: 100, height: 100)
                }
              }
            }
            .padding()
          }
          
          HStack(alignment: .center) {
            ForEach(viewModel.buttons ?? [], id: \.self) { button in
              Button(button.name) {
                viewModel.addShape(ofType: button.name)
//                viewModel.addShape(ofType: CricutCustomShape(from: button.name) ?? "circle")
              }
            }
          }
          .padding()
        }
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Clear All") {
              viewModel.removeAllShapes()
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button("Add") {
              //              viewModel.addShape(ofType: .Circle)
            }
          }
        }
      }
    }
    .task {
      // Perfrom task here
      await viewModel.fetchButtons()
    }
  }
}

#Preview {
  ContentView()
}
