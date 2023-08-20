//
//  GenreSelectionView.swift
//  MovieApp
//
//  Created by xavier on 18/08/23.
//

import SwiftUI

struct GenreSelectionView: View {
    
    let onSelected: (String) -> Void
    
    @State private var selectedGenre = "All"
    @StateObject private var genreVM = GenreListViewModel()
    
    var ignoresGenres: [String]?
    
    func prepareGenres() -> [GenreViewModel] {
        guard let ignoresGenres = ignoresGenres else {
            return genreVM.genres
        }
        return genreVM.genres.filter{ genre in
            return !ignoresGenres.contains(genre.name)
        }
    }
    
    var body: some View {
        Picker("Select", selection: $selectedGenre){
            ForEach(prepareGenres(), id: \.id){ genre in
                Text(genre.name).tag(genre.name)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onAppear {
            genreVM.getAllGenres()
        }
        .onChange(of: selectedGenre) { value in
            onSelected(value)
        }
    }
}

struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView(onSelected: {_ in })
    }
}
