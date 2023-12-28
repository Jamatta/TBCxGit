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
    @Published var data: [News] = []
    @Published var error: String?
    
    //MARK: Fetch
    func fetchNews() {
        let urlString = "https://api.thenewsapi.com/v1/news/top?api_token=mIeZkja2T9W00JU2aIX42QSRm6ItgQDjmjmKeA1P&locale=us&limit=3"
        guard let URL = URL(string: urlString) else {return}
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: NewsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.data = data.data
                print("suc")
            case .failure(let error):
                self.error = error.localizedDescription
                print("err")
                
            }
        }
        )
    }
}
