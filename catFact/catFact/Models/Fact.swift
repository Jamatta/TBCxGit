//
//  Fact.swift
//  catFact
//
//  Created by Nika Jamatashvili on 24.11.23.
//

import UIKit

struct CatFactResponse: Codable {
    let data: [Fact]
}

struct Fact: Codable {
    let fact: String
    let length: Int
}
