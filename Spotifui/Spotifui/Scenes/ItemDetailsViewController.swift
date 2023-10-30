//
//  ItemDetailsViewController.swift
//  Spotifui
//
//  Created by Nika Jamatashvili on 30.10.23.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    init(music: Music) {
        super.init(nibName: nil, bundle: nil)
        self.imageView.image = music.image
        self.titleLabel.text = music.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = spotyDark
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(titleLabel)
        constraintsSetup()
    }
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 16),
        ])
        
        titleLabel.textColor = spotyGreen
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
}
