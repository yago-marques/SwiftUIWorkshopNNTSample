//
//  Movie.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let backdropPath: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Double
    let releaseDate: String

    static func fromRemote(_ remoteMovie: RemoteMovie) -> Movie {
        .init(
            title: remoteMovie.title,
            backdropPath: remoteMovie.backdropPath,
            overview: remoteMovie.overview,
            popularity: remoteMovie.popularity,
            posterPath: remoteMovie.posterPath,
            voteAverage: remoteMovie.voteAverage,
            voteCount: remoteMovie.voteCount,
            releaseDate: remoteMovie.releaseDate
        )
    }

    static func getImageData(_ path: String) async throws -> Data {
        var imageUrl = URL(string: "https://image.tmdb.org/t/p/w500")!
        imageUrl.append(path: path)

        let (data, _) = try await URLSession.shared.data(for: .init(url: imageUrl))

        return data
    }
}
