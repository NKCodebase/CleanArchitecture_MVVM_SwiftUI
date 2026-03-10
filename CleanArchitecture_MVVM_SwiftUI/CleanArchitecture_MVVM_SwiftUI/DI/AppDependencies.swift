//
//  AppDependencies.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// DI/AppDependencies.swift
final class AppDependencies {
    static let shared = AppDependencies()
    
    lazy var movieRepository: MovieRepository = {
        let api = MovieAPI() //TMDbAPI()
        return MovieRepositoryImpl(api: api)
    }()
    
    lazy var getPopularMoviesUseCase: GetPopularMoviesUseCase = {
        GetPopularMoviesUseCaseImpl(repository: movieRepository)
    }()
    
    func makeMoviesViewModel() -> MoviesViewModel {
        MoviesViewModel(getPopularMovies: getPopularMoviesUseCase)
    }
}
