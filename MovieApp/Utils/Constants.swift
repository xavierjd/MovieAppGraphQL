//
//  Constants.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let apiKey = "de576683"
    }
    
    struct Urls {
        
        static func urlByMovieName(name: String) -> URL? {
            return URL(string: "https://www.omdbapi.com/?s=\(name)&page=2&apikey=\(Keys.apiKey)")
        }
    }
}
