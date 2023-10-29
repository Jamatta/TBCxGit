//
//  MusicCell.swift
//  Spotifui
//
//  Created by Nika Jamatashvili on 29.10.23.
//

import UIKit

class MusicCell: UITableViewCell {
    
    var musicImageView = UIImageView()
    var musicTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        UINavigationBar.appearance()
        addSubview(musicImageView)
        addSubview(musicTitle)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLableConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(music: Music) {
        musicImageView.image = music.image
        musicTitle.text = music.title
    }
    
    private func configureImageView() {
        musicImageView.layer.cornerRadius = 8
        musicImageView.clipsToBounds = true
    }
    
    private func configureTitleLabel() {
        musicTitle.numberOfLines = 0
        musicTitle.adjustsFontSizeToFitWidth = true
    }
    
    private func setImageConstraints() {
        
        NSLayoutConstraint.activate([
            musicImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            musicImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            musicImageView.heightAnchor.constraint(equalToConstant: 56),
            musicImageView.widthAnchor.constraint(equalToConstant: 56),
        ])
        
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setTitleLableConstraints() {
        
        NSLayoutConstraint.activate([
            musicTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            musicTitle.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 16),
            musicTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        musicTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
