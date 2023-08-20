//
//  AddNewMovieModel.swift
//  MovieApp
//
//  Created by xavier on 19/08/23.
//

import Foundation
import MoviesAPI


class AddNewMovieViewModel: ObservableObject {
    
    @Published var posters: [PosterViewModel] = []
    
    var name: String = ""
    var year: String = ""
    @Published  var poster: String = ""
    var genre: String = ""
    
    func addNewMovie(completion: @escaping () -> Void) {
        let movie = MovieInput(title: name, year: year, genre: genre, poster: poster)
        
        Network.shared.apollo.perform(mutation: AddNewMovieMutation(movie: .some(movie))){ result in
            switch result {
            case .success(_):
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPostersByMovieName(name: String) {
        WebService().getMovieByName(name: name) { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.posters = movies.map(PosterViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PosterViewModel {
    let movie: MovieModel
    
    let id = UUID()
    
    var title: String {
        movie.title
    }
    var poster: String {
        movie.poster
    }
}
