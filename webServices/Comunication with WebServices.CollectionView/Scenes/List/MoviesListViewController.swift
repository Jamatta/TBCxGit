//
//  Movie.swift
//  Comunication with WebServices
//
//  Created by Nana Jimsheleishvili on 06.11.23.
//  Edited by Jamata on 10.11.23
//

import UIKit
import Foundation

final class MoviesListViewController: UIViewController {
    
    private var movies: [Movie] = []
    
    // MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = UIColor(red: 252/255.0, green: 109/255.0, blue: 25/255.0, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 78).isActive = true
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchMovies()
    }
    
    // MARK: - Private Methods
    private func setup() {
        view.backgroundColor = UIColor(red: 26/255.0, green: 34/255.0, blue: 50/255.0, alpha: 1)
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        let logoItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = logoItem
        
        let profileButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItem = profileButtonItem
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.register(MovieItemCollectionViewCell.self, forCellWithReuseIdentifier: "MovieItemCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - CollectionView DataSource
extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieItemCell", for: indexPath) as? MovieItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView FlowLayoutDelegate
extension MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + flowLayout.minimumInteritemSpacing
        
        let width = Int((collectionView.bounds.width - totalSpace) / 2)
        let height = 278
        
        return CGSize(width: width, height: height)
    }
}

// MARK: - CollectionView Delegate
extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailsViewController()
        vc.configure(with: movies[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Movies Mock

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

func getMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
    let endpoint = "https://www.omdbapi.com/?i=tt3896198&apikey=41102e28&s=day"
    
    guard let url = URL(string: endpoint) else {
        completion(.failure(NetworkError.invalidURL))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            completion(.failure(NetworkError.invalidResponse))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let films = try decoder.decode(Welcome.self, from: data!)
            print(films)
            completion(.success(films.search))
        } catch {
            print(error)
            completion(.failure(NetworkError.invalidData))
        }
    }.resume()
}


// MARK: - Welcome
struct Welcome: Codable {
    let search: [MovieModel]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct MovieModel: Codable {
    let title: String
    let release: String
    let rating: String
    let type: TypeEnum
    let imageName: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case release = "Year"
        case rating = "imdbID"
        case type = "Type"
        case imageName = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}

extension MoviesListViewController {

    func updateUI(with films: [MovieModel]) {
            DispatchQueue.main.async {
                self.movies = films.map { movieModel in
                    return Movie(
                        imageName: movieModel.imageName,
                        title: movieModel.title,
                        release: movieModel.release,
                        rating: movieModel.rating
                    )
                }
                self.collectionView.reloadData()
            }
        }

        func fetchMovies() {
            getMovies { result in
                switch result {
                case .success(let films):
                    self.updateUI(with: films)
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
            }
        }
}
