//
//  GetPopularMoviesUseCase.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Domain/UseCases/GetPopularMoviesUseCase.swift
public protocol GetPopularMoviesUseCase {
    func execute(page: Int) async throws -> [Movie]
}

public final class GetPopularMoviesUseCaseImpl: GetPopularMoviesUseCase {
    private let repository: MovieRepository
    
    public init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(page: Int) async throws -> [Movie] {
        try await repository.getPopularMovies(page: page)
    }
}
