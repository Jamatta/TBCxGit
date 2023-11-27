//
//  BeerdCell.swift
//  catFact
//
//  Created by Nika Jamatashvili on 28.11.23.
//

import UIKit

class BreedCell: UITableViewCell {
    private let breedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    private let originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    private let coatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(breedLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(originLabel)
        contentView.addSubview(coatLabel)
        
        NSLayoutConstraint.activate([
            breedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            breedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            breedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            countryLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 4),
            countryLabel.leadingAnchor.constraint(equalTo: breedLabel.leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: breedLabel.trailingAnchor),
            
            originLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 4),
            originLabel.leadingAnchor.constraint(equalTo: breedLabel.leadingAnchor),
            originLabel.trailingAnchor.constraint(equalTo: breedLabel.trailingAnchor),
            
            coatLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 4),
            coatLabel.leadingAnchor.constraint(equalTo: breedLabel.leadingAnchor),
            coatLabel.trailingAnchor.constraint(equalTo: breedLabel.trailingAnchor),
            coatLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with breed: Breed) {
        breedLabel.text = breed.breed
        countryLabel.text = "Country: \(breed.country)"
        originLabel.text = "Origin: \(breed.origin)"
        coatLabel.text = "Coat: \(breed.coat)"
    }
}

