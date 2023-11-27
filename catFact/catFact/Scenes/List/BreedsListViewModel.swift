//
//  BreedsListViewModel.swift
//  catFact
//
//  Created by Nika Jamatashvili on 28.11.23.
//

import UIKit
import GenericNetworkManager

protocol BreedsListViewModelDelegate: AnyObject {
    func breedsFetched(_ breeds: [Breed])
    func showError(_ error: Error)
}

final class BreedsListViewModel {
    private let networkManager = NetworkManager()
    private let catBreedsAPIURL = URL(string: "https://catfact.ninja/breeds")!
    
    weak var delegate: BreedsListViewModelDelegate?
    
    func viewDidLoad() {
        fetchBreeds()
    }
    
    private func fetchBreeds() {
        networkManager.fetchData(from: catBreedsAPIURL) { [weak self] (result: Result<BreedsResponse, Error>) in
            switch result {
            case .success(let fetchedBreedsResponse):
                self?.delegate?.breedsFetched(fetchedBreedsResponse.data)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}

