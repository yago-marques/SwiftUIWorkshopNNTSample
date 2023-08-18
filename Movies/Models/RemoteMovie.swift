//
//  RemoteMovie.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import Foundation

struct RemoteMovie: Decodable {
    let title: String
    let backdropPath: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Double
    let releaseDate: String
}
