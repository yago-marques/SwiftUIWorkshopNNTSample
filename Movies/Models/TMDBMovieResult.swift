//
//  TMDBMovieResult.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import Foundation

struct TMDBMovieResult: Decodable {
    let results: [RemoteMovie]
}
