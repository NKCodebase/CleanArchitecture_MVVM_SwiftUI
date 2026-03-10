//
//  Movie.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Domain/Entities/Movie.swift
public struct Movie: Identifiable, Equatable {
    public let id: Int
    public let title: String
    public let posterPath: String?     // This can be relative (TMDB) or full URL (other APIs)
    public let overview: String
    public let voteAverage: Double
    
    public var posterURL: URL? {
        guard let path = posterPath, !path.isEmpty else { return nil }
        
        // Case 1: If it's already a full HTTPS URL (e.g. from sampleapis/Amazon), use as-is
        if path.hasPrefix("http://") || path.hasPrefix("https://") {
            return URL(string: path)
        }
        
        // Case 2: If it's TMDB-style relative path (e.g. "/abc123.jpg"), prepend base
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
