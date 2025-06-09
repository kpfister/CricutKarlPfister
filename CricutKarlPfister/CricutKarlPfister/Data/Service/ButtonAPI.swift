//
//  ButtonAPI.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation

// MARK: - Interface
protocol ButtonAPIProvidable: APIDataProvidable {
  func getButtons() async throws -> [CricutShape]
}

// MARK: - Error Handling
enum ShapeError: Error {
  case UnableToGetShapes(_ description: String)
}

struct ButtonAPIProvider: ButtonAPIProvidable {
  
  func getButtons() async throws -> [CricutShape] {
    guard let url = URL(string: "https://staticcontent.cricut.com/static/test/shapes_001.json") else {
      throw NetworkingError.invalidURL
    }
    let request = URLRequest(url: url)
    let results = try await perform(request, type: CricutShapeTopLevel.self)
    return results.buttons
  }
}
