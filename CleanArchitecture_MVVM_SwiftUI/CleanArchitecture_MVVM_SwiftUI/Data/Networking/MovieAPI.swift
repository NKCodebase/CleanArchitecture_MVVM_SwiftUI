//
//  MovieAPI.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Data/Networking/MovieAPI.swift  (renamed for clarity)
actor MovieAPI {
    private let session = URLSession.shared
    private let base = "https://api.sampleapis.com/movies"
    
    func getMovies() async throws -> [Movie] {
        let url = URL(string: "\(base)/classic")!  // or /comedy, /animation, etc.
        let (data, response) = try await session.data(from: url)
        
        // Debug: always print this!
        if let status = (response as? HTTPURLResponse)?.statusCode {
            print("HTTP Status: \(status)")
        }
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON:\n\(jsonString.prefix(1000))...")  // first 1000 chars
        }
        
        let decoder = JSONDecoder()
        let dtos = try decoder.decode([MovieDTO].self, from: data)
        return dtos.compactMap { $0.toDomain() }
    }
}
