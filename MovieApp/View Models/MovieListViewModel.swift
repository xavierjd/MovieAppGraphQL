//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import Foundation
import Apollo
import MoviesAPI
import ApolloTestSupport
import MoviesAPITestMocks


class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    
    func deleteMovie(movieId: String) {
        Network.shared.apollo.perform(mutation: DeleteMovieMutation(movieId: movieId)){ [weak self] result in
            switch result { 
            case .success( _ ):
                self?.fetchAllMovies()
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func fetchAllMovies(genre: String? = nil) {
        Network.shared.apollo.fetch(query: GetAllMoviesQuery(genre: genre ?? .null), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.movies {
                    DispatchQueue.main.async {
                        self?.movies = process(data: data)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
            case .failure(let error):
                print(error)

            }
        }
    }
}
func process(data: [MoviesData?]?) -> [Movie] {
    return MoviesModel(data).movies
}



//let mock = Mock(genre: "dsd", id: "3", poster: "dddd", title: "ddd", year: "222")
//let model = GetAllMoviesQuery.Data.Movie.from(mock)

//struct MovieViewModel {
//    let movie: GetAllMoviesQuery.Data.Movie
//
//    var id: String {
//        movie.id
//        movi
//    }
//
//    var title: String {
//        movie.title
//    }
//
//    var year: String {
//        movie.year
//    }
//
//    var genre: String {
//        movie.genre
//    }
//
//    var poster: String {
//        movie.poster
//    }
//
//}
