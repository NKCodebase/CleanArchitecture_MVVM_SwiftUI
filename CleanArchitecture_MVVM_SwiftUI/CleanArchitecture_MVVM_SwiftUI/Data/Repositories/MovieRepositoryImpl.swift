//
//  MovieRepositoryImpl.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Data/Repositories/MovieRepositoryImpl.swift
final class MovieRepositoryImpl: MovieRepository {
    private let api: MovieAPI
    
    init(api: MovieAPI = MovieAPI()) {
        self.api = api
    }
    
    func getPopularMovies(page: Int) async throws -> [Movie] {
        try await api.getMovies()  // returns all at once
    }
}
