//
//  Breed.swift
//  catFact
//
//  Created by Nika Jamatashvili on 28.11.23.
//

import UIKit

struct Breed: Codable {
    let breed: String
    let country: String
    let origin: String
    let coat: String
}

struct BreedsResponse: Codable {
    let data: [Breed]
}
