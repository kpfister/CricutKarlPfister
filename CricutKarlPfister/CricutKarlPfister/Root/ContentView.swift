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
        ScrollView {
          LazyVGrid(columns: gridItems) {
            ForEach(1..<8) { _ in
              Circle()
            }
          }
        }
        .padding()
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Clear All") {
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button("Add") {
              
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
