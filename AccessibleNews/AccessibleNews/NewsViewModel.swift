//
//  NewsViewModel.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI
import NetworkManager

final class NewsViewModel: ObservableObject {
    
    //MARK: Properties
//    @Published var Articles: [Article] = []
    @Published var Articles: [Article] = []
    @Published var error: String?
    
    init() {
        fetchNews()
    }
    
    //MARK: Fetch
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-28&sortBy=publishedAt&apiKey=8671ece050cf477d972c390b8b85c539"
        guard let URL = URL(string: urlString) else {return}
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ArticlesData.self, completion: { result in
            switch result {
            case .success(let data):
                self.Articles = data.Articles
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
        )
    }
    
}
