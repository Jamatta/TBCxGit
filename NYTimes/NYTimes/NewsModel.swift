//
//  NewsModel.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 03.01.24.
//

import Foundation

struct News: Hashable {
    let id = UUID()
    var title: String
    var description: String
    var selectedDate: Date
}
