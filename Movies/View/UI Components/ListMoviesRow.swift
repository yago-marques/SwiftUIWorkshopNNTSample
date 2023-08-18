//
//  ListMoviesRow.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import SwiftUI

struct ListMoviesRow: View {
    let movie: Movie

    @State var posterImage = Data()

    var body: some View {
        HStack() {
            Image(uiImage: UIImage(data: posterImage) ?? UIImage(named: "elements")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)

            VStack(alignment: .leading) {
                Text(movie.title)
                    .bold()
                    .font(.headline)

                Text("Avaliações: \(movie.voteAverage.formatted())(\(movie.voteCount.formatted()))")
                    .font(.body)
                    .padding([.top], 10)

                Text("Popularidade: \(movie.popularity.formatted())")
                    .font(.body)
                    .padding([.top], 1)
            }
            .padding([.leading], 5)
        }
        .task {
            do {
                posterImage = try await Movie.getImageData(movie.posterPath)
            } catch {
                print(error)
            }
        }
    }
}
