//
//  MoviesView.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import Foundation
import SwiftUI

// Presentation/Features/Movies/MoviesView.swift
struct MoviesView: View {
    @State private var viewModel: MoviesViewModel
    
    init(viewModel: MoviesViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundStyle(.red)
                } else {
                    List(viewModel.movies) { movie in
                        HStack {
                            if let url = movie.posterURL {
                                AsyncImage(url: movie.posterURL) { phase in
                                    switch phase {
                                    case .empty:
                                        Color.gray.opacity(0.3)
                                            .frame(width: 60, height: 90)
                                            .overlay(ProgressView())
                                    case .success(let image):
                                        image.resizable().scaledToFit()
                                    case .failure:
                                        Image(systemName: "film")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 60, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            VStack(alignment: .leading) {
                                Text(movie.title).font(.headline)
                                Text("★ \(String(format: "%.1f", movie.voteAverage))")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .task {
                await viewModel.loadPopularMovies()
            }
        }
    }
}
