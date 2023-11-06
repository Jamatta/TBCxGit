//
//  NoteCell.swift
//  Note
//
//  Created by Nika Jamatashvili on 06.11.23.
//

import UIKit

class NoteCell: UITableViewCell {
    
    private var notesTitleLabel = UILabel()
    private var notesTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        UINavigationBar.appearance()
        addSubview(notesTitleLabel)
        addSubview(notesTextLabel)
        
        configureTitleLabel()
        setTitleLabelConstraints()
        setTextLabelConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        notesTitleLabel.text = nil
        notesTextLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(notes: Notes) {
        notesTitleLabel.text = notes.title
        notesTextLabel.text = notes.noteText
    }
    
    private func configureTitleLabel() {
        notesTitleLabel.numberOfLines = 0
        notesTitleLabel.adjustsFontSizeToFitWidth = true
        notesTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        notesTitleLabel.textColor = blackColor
    }
    
    private func configureTextLabel() {
        notesTextLabel.numberOfLines = 0
        notesTextLabel.adjustsFontSizeToFitWidth = true
        notesTextLabel.font = UIFont.systemFont(ofSize: 14)
        notesTextLabel.textColor = .lightText
    }
    
    private func setTitleLabelConstraints() {
        
        NSLayoutConstraint.activate([
            notesTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            notesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notesTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        notesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setTextLabelConstraints() {
        
        NSLayoutConstraint.activate([
            notesTextLabel.topAnchor.constraint(equalTo: notesTitleLabel.bottomAnchor, constant: 4),
            notesTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notesTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        notesTextLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
