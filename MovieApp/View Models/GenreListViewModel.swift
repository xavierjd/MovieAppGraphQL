//
//  GenreListViewModel.swift
//  MovieApp
//
//  Created by xavier on 18/08/23.
//

import Foundation
import MoviesAPI
import Apollo

class GenreListViewModel: ObservableObject {
    
    @Published var genres: [GenreViewModel] = []
    
    func getAllGenres() {
        Network.shared.apollo.fetch(query: GetAllGenresQuery()){ [weak self] result in
            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data,
                      let genres = data.genres
                else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.genres = genres.compactMap{ $0 }.map(GenreViewModel.init)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}

struct GenreViewModel: Identifiable, Hashable, Equatable {
    let id = UUID().uuidString
    fileprivate let genre: GetAllGenresQuery.Data.Genre
    
    var name: String {
        genre.name
    }
    
//    static var defaultGenre: GenreViewModel {
//        return GenreViewModel(genre: )
//    }
    
    public static func == (lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
