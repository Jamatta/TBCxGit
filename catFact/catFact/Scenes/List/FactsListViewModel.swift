//
//  FactsListViewModel.swift
//  catFact
//
//  Created by Nika Jamatashvili on 24.11.23.
//

import UIKit
import GenericNetworkManager

protocol CatFactsListViewModelDelegate: AnyObject {
    func factFetched(_ facts: [Fact])
    func showError(_ error: Error)
}

final class FactsListViewModel {
    private let networkManager = NetworkManager()
    private let catFactsAPIURL = URL(string: "https://catfact.ninja/facts")!
    
    weak var delegate: CatFactsListViewModelDelegate?
    
    func viewDidLoad() {
        fetchFacts()
    }
    
    private func fetchFacts() {
        networkManager.fetchData(from: catFactsAPIURL) { [weak self] (result: Result<CatFactResponse, Error>) in
            switch result {
            case .success(let fetchedFactsResponse):
                self?.delegate?.factFetched(fetchedFactsResponse.data)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}

