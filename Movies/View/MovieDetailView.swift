//
//  MovieDetailView.swift
//  Movies
//
//  Created by Yago Marques on 18/08/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    @State var bannerImage = Data()
    @State var posterPath = Data()

    var body: some View {
        ScrollView {
            Image(uiImage: .init(data: posterPath) ?? UIImage(named: "elements")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220)
                .padding(40)
                .background {
                    Image(uiImage: .init(data: bannerImage) ?? UIImage(named: "elementsBackdrop")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .blur(radius: 3, opaque: false)
                }

            VStack(alignment: .leading, spacing: 20) {
                Text(movie.title)
                    .font(.title)
                    .bold()

                Text("Avaliações: \(movie.voteAverage.formatted())(\(movie.voteCount.formatted()))")
                    .font(.headline)

                Text("Popularidade: \(movie.popularity.formatted())")
                    .font(.headline)

                Text("Lançamento: \(movie.releaseDate)")
                    .font(.headline)

                Text(movie.overview)
            }
            .padding(15)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                bannerImage = try await Movie.getImageData(movie.backdropPath)
                posterPath = try await Movie.getImageData(movie.posterPath)
            } catch {
                print(error)
            }
        }
    }
}
