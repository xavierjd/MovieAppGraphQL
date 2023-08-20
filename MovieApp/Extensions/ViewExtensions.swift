//
//  ViewExtensions.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
