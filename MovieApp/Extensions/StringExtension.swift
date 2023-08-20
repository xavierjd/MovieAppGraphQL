//
//  StringExtension.swift
//  MovieApp
//
//  Created by xavier on 17/08/23.
//

import Foundation

extension String {
    func encoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
