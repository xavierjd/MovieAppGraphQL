//
//  WebService.swift
//  MovieApp
//
//  Created by xavier on 19/08/23.
//

import Foundation

enum NetWorkError: Error {
    case badURL
    case noData
    case decodingError
}

class WebService {
    func getMovieByName(name: String, completion: @escaping(Result<[MovieModel], NetWorkError>) -> Void){
        guard let url = Constants.Urls.urlByMovieName(name: name) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            print(data)
            let movieResponse = try? JSONDecoder().decode(MovieResponseModel.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
