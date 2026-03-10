//
//  MovieRepository.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation

// Domain/Repositories/MovieRepository.swift  ← protocol lives in Domain!
public protocol MovieRepository {
    func getPopularMovies(page: Int) async throws -> [Movie]
}
