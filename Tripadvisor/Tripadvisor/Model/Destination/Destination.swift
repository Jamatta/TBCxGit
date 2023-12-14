//
//  Destination.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 13.12.23.
//

import SwiftUI

struct Destination: Identifiable {
    let id: UUID
    let name: String
    let country: String
    let description: String
    let transport: Transport
    let mustSeePlaces: [MustSeePlace]
    let hotels: [Hotel]
    let imageName: String
}

struct Transport {
    let name: String
    let imageName: String
    let description: String
    let destination: Int
}

struct MustSeePlace {
    let name: String
    let imageName: String
    let description: String
    let destination: Int
}

struct Hotel {
    let name: String
    let imageName: String
    let rating: Double
    let destination: Int
}
