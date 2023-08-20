//
//  MovieListView.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false
    
    private func genreSelected(selectedGenre: String) {
        switch selectedGenre {
        case "All":
            movieListVM.fetchAllMovies()
        default:
            movieListVM.fetchAllMovies(genre: selectedGenre)
        }
    }
    
    var body: some View {
        VStack {
            
            GenreSelectionView(onSelected: genreSelected)
            
            Spacer()
            
            //Show list of Movies
            if !movieListVM.movies.isEmpty {
                MovieRowView(movies: movieListVM.movies){ movieId in
                    movieListVM.deleteMovie(movieId: movieId)
                }
            } else {
                NoResultView(message: "No movies found")
            }
            
            Spacer()
        }
        .sheet(isPresented: $isPresented, onDismiss:  {
            movieListVM.fetchAllMovies()
        }, content: {
            AddMovieView()
        })
        .onAppear(perform: {
            movieListVM.fetchAllMovies()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Movies")
        .embedInNavigationView()
    }

}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
