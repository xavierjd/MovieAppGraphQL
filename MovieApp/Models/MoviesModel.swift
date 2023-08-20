//
//  MoviesModel.swift
//  MovieApp
//
//  Created by xavier on 18/08/23.
//

import Foundation
import MoviesAPI

typealias MoviesData = GetAllMoviesQuery.Data.Movie

struct MoviesModel: Codable {
    var movies: [Movie]
    
    init(_ movies: [MoviesData?]?) {
        self.movies = movies?.compactMap{$0}.map(Movie.init) ?? []
    }
}

struct Movie: Codable {
    var id, title, year, genre: String
    var poster: String
    
    init(_ movie: MoviesData?) {
        self.id = movie?.id ??  ""
        self.title = movie?.title ??  ""
        self.year = movie?.year ??  ""
        self.genre = movie?.genre ??  ""
        self.poster = movie?.poster ??  ""
    }
}
