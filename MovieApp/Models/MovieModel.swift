//
//  Movie.swift
//  MovieApp
//
//  Created by xavier on 19/08/23.
//

import Foundation


struct MovieResponseModel: Codable {
    let movies: [MovieModel]
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct MovieModel: Codable {
    let title: String
    let year: String
    let poster: String
    let imdbID: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case imdbID
    }
}
