//
//  Movie.swift
//  Comunication with webServices (MVVM) 25
//
//  Created by Nika Jamatashvili on 20.11.23.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
