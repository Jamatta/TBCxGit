//
//  MoviesList.swift
//  Comunication with webServices (MVVM) 25
//
//  Created by Nika Jamatashvili on 21.11.23.
//

import Foundation

protocol MoviesListViewModelDelegate: AnyObject {
    func moviesFetched(_ movies: [Movie])
    func showError(_ error: Error)
    func navigateToMovieDetails(with movieId: Int)
}

final class MoviesListViewModel {
    private var movies: [Movie]?
    
    weak var delegate: MoviesListViewModelDelegate?
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func didSelectMovie(at indexPath: IndexPath) {
        if let moviesID = movies?[indexPath.row].id {
            delegate?.navigateToMovieDetails(with: moviesID)
        }
    }
    
    private func fetchMovies() {
        NetworkManager.shared.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.delegate?.moviesFetched(movies)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
