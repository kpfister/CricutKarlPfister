//
//  AlertModalView.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import SwiftUI

struct AlertModalView: View {
  @ObservedObject var viewModel: GridViewModel
  
  var body: some View {
    VStack(spacing: 20) {
      
      if viewModel.isLoading {
        ProgressView()
      }
      
      Text(viewModel.errorMessage ?? "Whoops")
        .font(.title2)
        .foregroundStyle(.red)
        .multilineTextAlignment(.center)
        .padding()
      
      if viewModel.isFetchError {
        Button("Retry?") {
          Task {
            await viewModel.fetchButtons()
          }
        }
      }
      
    }
    .padding()
  }
}
