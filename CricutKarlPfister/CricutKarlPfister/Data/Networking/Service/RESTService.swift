//
//  RESTService.swift
//  CricutKarlPfister
//
//  Created by Karl Pfister on 6/9/25.
//

import Foundation
/// An abstraction of the `URLSession.shared.data(for: request) Async Await`
/// ```
/// func perform(_ request: URLRequest) async throws -> Data)
/// ```
///
/// - Parameters
///   - request: A URL request object that provides the URL, cache policy, request type, body data or body stream, and so on.

protocol APIDataProvidable {
  
  func perform<Object: Decodable>(_ request: URLRequest, type: Object.Type) async throws -> Object
}

extension APIDataProvidable {
  /// Extention of the `APIDataProvidable` protocol
  ///
  /// This is used to provide a default implementaion of the `.perform(_ request: URLRequest)` protocol method.
  func perform<Object: Decodable>(_ request: URLRequest, type: Object.Type) async throws -> Object {
    let (data, _ ) = try await URLSession.shared.data(for: request)
    
    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let object = try decoder.decode(Object.self, from: data)
      return object
    } catch {
      throw NetworkingError.unableToDecode
    }
  }
}
