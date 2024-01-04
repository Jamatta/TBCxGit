//
//  DailyNewsSceneViewModel.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 03.01.24.
//

import SwiftUI

class DailyNewsSceneViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var selectedDate = Date()
    @Published var newsArray: [News] = []
   
    func saveNews() {
        
        let newNews = News(title: title, description: description, selectedDate: selectedDate)
        print("newNews - \(newNews.title)")
        newsArray.append(newNews)
                
        title = ""
        description = ""
        selectedDate = Date()
    }
    
    func removeNews(at offsets: IndexSet) {
        newsArray.remove(atOffsets: offsets)
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        newsArray.move(fromOffsets: source, toOffset: destination)
    }
    
    func sortByAlphabetically() {
        newsArray.sort { $0.title.localizedStandardCompare($1.title) == .orderedAscending }
    }
}
