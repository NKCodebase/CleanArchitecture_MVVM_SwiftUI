//
//  MovieDTO.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Data/DTOs/MovieDTO.swift
struct MovieDTO: Decodable {
    let title: String
    let year: Int?
    let posterURL: String?      // Note: field is camelCase "posterURL"
    let imdbRating: String?     // comes as string like "8.5"
    
    // If property names matched JSON exactly → no CodingKeys needed!
    // But to be safe/explicit:
    enum CodingKeys: String, CodingKey {
        case title
        case year
        case posterURL = "posterURL"   // matches JSON
        case imdbRating = "imdbRating"
    }
    
    func toDomain() -> Movie {
        let fakeId = abs(title.hashValue)   // or any stable hash/int generation
        
        return Movie(
            id: fakeId,   // positive Int
            title: title,
            posterPath: posterURL,      // full URL already
            overview: "Classic movie from \(year ?? 0)",    // placeholder
            voteAverage: Double(imdbRating ?? "0.0") ?? 0.0
        )
    }
}
