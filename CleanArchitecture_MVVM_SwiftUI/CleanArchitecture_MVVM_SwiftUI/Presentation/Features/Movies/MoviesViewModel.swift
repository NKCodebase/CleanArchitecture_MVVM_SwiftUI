//
//  MoviesViewModel.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Presentation/Features/Movies/MoviesViewModel.swift
@Observable
final class MoviesViewModel {
    private let getPopularMovies: GetPopularMoviesUseCase
    
    var movies: [Movie] = []
    var isLoading = false
    var errorMessage: String?
    
    init(getPopularMovies: GetPopularMoviesUseCase) {
        self.getPopularMovies = getPopularMovies
    }
    
    func loadPopularMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedMovies = try await getPopularMovies.execute(page: 1)
            movies = fetchedMovies
            
            // Debug: check URLs in console
            for movie in movies {
                let urlString = movie.posterURL?.absoluteString ?? "invalid"
                print("• \(movie.title) | posterPath: \(movie.posterPath ?? "nil") | URL: \(urlString)")
            }
        } catch {
            errorMessage = "Failed to load movies: \(error.localizedDescription)"
            print("Error: \(error)") // also log full error
        }
        
        isLoading = false
    }
}
