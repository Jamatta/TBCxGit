//
//  Movie.swift
//  Comunication with WebServices
//
//  Created by Nana Jimsheleishvili on 06.11.23.
//  Edited by Jamata on 10.11.23
//

import UIKit

final class MovieItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleGenreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, genreLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - CellLifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        movieImageView.image = nil
        genreLabel.text = nil
        titleLabel.text = nil
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }

    // MARK: - Private Methods
    private func addSubview() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(topButtonStackView)
        contentView.addSubview(titleGenreStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            topButtonStackView.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 8),
            topButtonStackView.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 8),
            topButtonStackView.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            titleGenreStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            titleGenreStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleGenreStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        let topRightButton = createTopButton()
        topButtonStackView.addArrangedSubview(favoriteButton)
        topButtonStackView.addArrangedSubview(topRightButton)
    }

    private func setupButtonAction() {
        favoriteButton.addAction(
            UIAction(
                title: "",
                handler: { [weak self] _ in
                    let isFavorite = self?.favoriteButton.currentImage == UIImage(systemName: "heart.fill")
                    self?.favoriteButton.setImage(UIImage(systemName: isFavorite ? "heart" : "heart.fill"), for: .normal)
                }
            ),
            for: .touchUpInside
        )
    }
    
    // MARK: - Helper Methods
    // რეიტინგი არგამიკეთებია :3
    private func createTopButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Configuration
    func configure(with movie: Movie) {
        movieImageView.image = UIImage(named: movie.imageName) ?? UIImage()
        titleLabel.text = movie.title
    }
}

