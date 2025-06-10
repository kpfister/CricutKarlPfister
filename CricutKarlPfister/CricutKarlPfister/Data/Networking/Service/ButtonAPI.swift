//
//  ButtonAPI.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation

// MARK: - Interface
protocol ButtonAPIProvidable: APIDataProvidable {
  func getButtons() async throws -> [CricutButton]
}

struct ButtonAPIProvider: ButtonAPIProvidable {
  
  func getButtons() async throws -> [CricutButton] {
    guard let url = URL(string: "https://staticcontent.cricut.com/static/test/shapes_001.json") else {
      throw NetworkingError.invalidURL
    }
    let request = URLRequest(url: url)
    let results = try await perform(request, type: CricutButtonTopLevel.self)
    return results.buttons
  }
}
