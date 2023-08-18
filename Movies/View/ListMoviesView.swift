//
//  ListMoviesView.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import SwiftUI


struct ListMoviesView: View {
    @ObservedObject var viewModel = ListMoviesViewModel()

    @State var networkingError = false

    var body: some View {
        NavigationStack {
            if networkingError {
                NetworkingErrorView()
            } else {
                listOfMovies
                    .navigationTitle("Filmes populares")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
        .task {
            do {
                try await viewModel.fetchRemotePopularMovies()
            } catch {
                networkingError = true
            }
        }
    }

    private var listOfMovies: some View {
        List(viewModel.movies) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                ListMoviesRow(movie: movie)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
