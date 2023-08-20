//
//  AddMovieView.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import SwiftUI

struct AddMovieView: View {
    
    @StateObject private var addMovieVM = AddNewMovieViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Form {
            
            TextField("Name", text: $addMovieVM.name, onEditingChanged: { _ in}) {
                //perform a REST api request to get the posters
                addMovieVM.fetchPostersByMovieName(name: addMovieVM.name.encoded())
            }
            
            GenreSelectionView(onSelected: { selectedMovie in
                addMovieVM.genre = selectedMovie
            }, ignoresGenres: ["All"])
            
            TextField("Year", text: $addMovieVM.year)
            
            MoviePosterGridView(posters: addMovieVM.posters, selectedPoster: $addMovieVM.poster)
            
        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(trailing: Button("Save", action: {
            addMovieVM.addNewMovie {
                presentationMode.wrappedValue.dismiss()
            }
        }))
        .embedInNavigationView()
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
