//
//  CustomCollectionViewCell.swift
//  Netflix
//
//  Created by Nika Jamatashvili on 04.11.23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "spider")
        return imageView
    }()
    
    private let cellLabelView: UILabel = {
        let label = UILabel()
        label.text = "Spider-Man"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(cellImageView)
        mainStackView.addArrangedSubview(cellLabelView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellImageView.heightAnchor.constraint(equalTo: cellImageView.widthAnchor),
        ])
    }
}

