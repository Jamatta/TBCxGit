//
//  MovieDetail.swift
//  Netflix
//
//  Created by Nika Jamatashvili on 04.11.23.
//

import UIKit

struct Movie {
    var title: String
    var certificate: String
    var runtime: String
    var releaseYear: String
    var genre: [String]
    var director: String
    var cast: [String]
    var imdbRating: Double
    var image: UIImage?
    
    init(title: String, certificate: String, runtime: String, releaseYear: String, genre: [String], director: String, cast: [String], imdbRating: Double, image: UIImage?) {
        self.title = title
        self.certificate = certificate
        self.runtime = runtime
        self.releaseYear = releaseYear
        self.genre = genre
        self.director = director
        self.cast = cast
        self.imdbRating = imdbRating
        self.image = image
    }
}

let batmanMovie = Movie(
    title: "The Batman",
    certificate: "16+",
    runtime: "02:56",
    releaseYear: "2022",
    genre: ["Action"],
    director: "Matt Reeves",
    cast: [
        "Robert Pattinson",
        "Zoë Kravitz",
        "Jeffrey Wright",
        "Colin Farrell",
        "Paul Dano",
        "John Turturro",
        "Andy Serkis",
        "Peter Sarsgaard"
    ],
    imdbRating: 7.5,
    image: UIImage(named: "batman_image")
)
