//
//  NewsModel.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI

struct ArticlesData: Decodable {
    let Articles: [Article]
}

//struct News: Decodable {
//    let uuid: String
//    let title: String
//    let description: String
//    let url: String
//    let imageURL: String
//    
//    enum CodingKeys: String, CodingKey {
//          case uuid, title, description, url
//          case imageURL = "image_url"
//      }
//}
// ----------------------------------

// MARK: - Welcome
struct Welcome: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
