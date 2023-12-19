//
//  Data.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 13.12.23.
//

import SwiftUI

class dataView: ObservableObject {
    
    @Published var destinations: [Destination] = [
        Destination(
            id: UUID(),
            name: "Paris",
            country: "France",
            description: "Paris, the romantic capital of France, mesmerizes with its charm and elegance. From the iconic Eiffel Tower to the Louvre Museum's artistic treasures, Paris delights visitors with its rich history, culture, and culinary delights.",
            transport: Transport(name: "Public Transportation", imageName: "metro", description: "Efficient metro system.", destination: 1),
            mustSeePlaces: [
                MustSeePlace(name: "Eiffel Tower", imageName: "eiffel_tower", description: "Iconic landmark.", destination: 7),
                MustSeePlace(name: "Louvre Museum", imageName: "louvre_museum", description: "Famous art museum.", destination: 7)
            ],
            hotels: [
                Hotel(name: "Ritz Paris", imageName: "ritz_paris", rating: 4.8, destination: 7),
                Hotel(name: "Hotel Plaza Athenee", imageName: "plaza_athenee", rating: 4.7, destination: 7)
            ],
            imageName: "paris"
        ),
        Destination(
            id: UUID(),
            name: "New York",
            country: "United States",
            description: "New York City, the city that never sleeps, exudes energy and diversity. Home to iconic landmarks such as the Statue of Liberty and the sprawling Central Park, it's a melting pot of culture, art, and global influences.",
            transport: Transport(name: "Subway", imageName: "subway", description: "Extensive subway system.", destination: 2),
            mustSeePlaces: [
                MustSeePlace(name: "Statue of Liberty", imageName: "statue_of_liberty", description: "Symbol of freedom.", destination: 8),
                MustSeePlace(name: "Central Park", imageName: "central_park", description: "Famous urban park.", destination: 8)
            ],
            hotels: [
                Hotel(name: "The Plaza Hotel", imageName: "plaza_hotel", rating: 4.6, destination: 8),
                Hotel(name: "Four Seasons Hotel", imageName: "four_seasons", rating: 4.9, destination: 8)
            ],
            imageName: "new_york"
        ),
        Destination(
            id: UUID(),
            name: "Tokyo",
            country: "Japan",
            description: "Tokyo, the bustling metropolis of Japan, harmoniously blends tradition with modernity. From the iconic Tokyo Tower to the serene Senso-ji Temple, Tokyo invites visitors to explore its vibrant neighborhoods and experience its technological innovations.",
            transport: Transport(name: "JR Yamanote Line", imageName: "jr_line", description: "Circular railway line.", destination: 3),
            mustSeePlaces: [
                MustSeePlace(name: "Tokyo Tower", imageName: "tokyo_tower", description: "Observation tower.", destination: 9),
                MustSeePlace(name: "Senso-ji Temple", imageName: "sensoji_temple", description: "Historic Buddhist temple.", destination: 9)
            ],
            hotels: [
                Hotel(name: "Park Hyatt Tokyo", imageName: "park_hyatt", rating: 4.9, destination: 9),
                Hotel(name: "Keio Plaza Hotel", imageName: "keio_plaza", rating: 4.7, destination: 9)
            ],
            imageName: "tokyo"
        ),
        Destination(
            id: UUID(),
            name: "Rome",
            country: "Italy",
            description: "Rome, the Eternal City of Italy, offers a captivating journey through history. Known for its ancient marvels like the Colosseum and the majestic Trevi Fountain, Rome is a treasure trove of art, architecture, and rich cultural heritage.",
            transport: Transport(name: "Metro", imageName: "romemtr", description: "Underground transportation.", destination: 4),
            mustSeePlaces: [
                MustSeePlace(name: "Colosseum", imageName: "colosseum", description: "Ancient amphitheater.", destination: 10),
                MustSeePlace(name: "Trevi Fountain", imageName: "trevi_fountain", description: "Baroque fountain.", destination: 10)
            ],
            hotels: [
                Hotel(name: "Hotel Eden", imageName: "hotel_eden", rating: 4.8, destination: 10),
                Hotel(name: "Grand Hotel de la Minerve", imageName: "minerve_hotel", rating: 4.6, destination: 10)
            ],
            imageName: "rome"
        ),
        Destination(
            id: UUID(),
            name: "London",
            country: "United Kingdom",
            description: "London, the historic capital of the United Kingdom, boasts a diverse cultural landscape intertwined with iconic landmarks. From the majestic Big Ben to the culturally rich British Museum, it offers a vibrant blend of history and modernity.",
            transport: Transport(name: "London Underground", imageName: "london_underground", description: "Famous subway system.", destination: 5),
            mustSeePlaces: [
                MustSeePlace(name: "Big Ben", imageName: "big_ben", description: "Symbol of London.", destination: 11),
                MustSeePlace(name: "British Museum", imageName: "british_museum", description: "Rich in art and culture.", destination: 11)
            ],
            hotels: [
                Hotel(name: "The Ritz London", imageName: "ritz_london", rating: 4.7, destination: 11),
                Hotel(name: "Shangri-La Hotel", imageName: "shangri_la", rating: 4.9, destination: 11)
            ],
            imageName: "london"
        ),
        Destination(
            id: UUID(),
            name: "Sydney",
            country: "Australia",
            description: "Sydney, Australia's harbor city, is renowned for its stunning landmarks and breathtaking scenery. From the iconic Sydney Opera House, a symbol of artistic brilliance, to the vibrant shores of Bondi Beach, Sydney is a captivating destination blending natural beauty with urban charm.",
            transport: Transport(name: "Sydney Trains", imageName: "sydney_trains", description: "Efficient train network.", destination: 6),
            mustSeePlaces: [
                MustSeePlace(name: "Sydney Opera House", imageName: "opera_house", description: "Iconic performing arts venue.", destination: 12),
                MustSeePlace(name: "Bondi Beach", imageName: "bondi_beach", description: "Famous beach destination.", destination: 12)
            ],
            hotels: [
                Hotel(name: "Four Seasons Hotel Sydney", imageName: "sydney_four_seasons", rating: 4.6, destination: 12),
                Hotel(name: "Park Hyatt Sydney", imageName: "park_hyatt_sydney", rating: 4.8, destination: 12)
            ],
            imageName: "sydney"
        )
    ]
}
