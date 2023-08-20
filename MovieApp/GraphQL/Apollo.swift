//
//  Apollo.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import Foundation
import Apollo

class Network {
    static let shared: Network = Network()
    
    private init() {}
    
    lazy var apollo = ApolloClient(url: URL(string: "https://us-central1-swiftui-movies-app.cloudfunctions.net/graphql")!)
}
