//
//  NewsModel.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI

// MARK: - NewsData
struct NewsData: Decodable {
    let data: [News]
}

// MARK: - News
struct News: Decodable {
    let title, description: String
    let publishedAt, source: String

    enum CodingKeys: String, CodingKey {
        case title, description
        case publishedAt = "published_at"
        case source
    }
}
