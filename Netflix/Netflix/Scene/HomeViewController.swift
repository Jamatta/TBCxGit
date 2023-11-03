//
//  HomeViewController.swift
//  Netflix
//
//  Created by Nika Jamatashvili on 03.11.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private let contentWrapper: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = bgColor
        view.addSubview(contentWrapper)
        collectionViewSetup()
        contentWrapperConstraintsSetup() 
    }
    
    private func contentWrapperConstraintsSetup() {
        NSLayoutConstraint.activate([
            contentWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        contentWrapper.addArrangedSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2 - 40, height: 278)
    }
}
