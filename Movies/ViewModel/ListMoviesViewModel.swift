//
//  RemotrMoviesLoader.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import SwiftUI

final class ListMoviesViewModel: ObservableObject {
    @Published var movies = [Movie]()

    @MainActor
    func fetchRemotePopularMovies() async throws {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=2123f7821fc1adc226b8d60b70f445e6&language=pt-BR")!

        let request = URLRequest(url: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let (data, _) = try await URLSession.shared.data(for: request)

        let remoteMovies = try decoder.decode(TMDBMovieResult.self, from: data)

        self.movies = remoteMovies.results.map { Movie.fromRemote($0) }
    }
}
