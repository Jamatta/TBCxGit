//
//  AddNoteViewController.swift
//  Note
//
//  Created by Nika Jamatashvili on 06.11.23.
//

import UIKit

protocol AddNewNoteDelegate: AnyObject {
    func addNewNotes(title: String, noteText: String)
}

final class AddNoteViewController: UIViewController {
    
    weak var delegate: AddNewNoteDelegate?
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabelField, textLabelField, saveNoteButton])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.backgroundColor = whiteColor
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        return stackView
    }()
    
    private let titleLabelField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter note name"
        return textField
    }()
    
    private let textLabelField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter note description"
        return textField
    }()
    
    private let saveNoteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = greenColor
        button.layer.cornerRadius = 8
        button.setTitle("Save Note", for: .normal)
        button.setTitleColor(whiteColor, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupConstraints()
        setupButtonAction()
    }
    
    private func setupBackground() {
        view.backgroundColor = blackColor
    }
    
    private func setupSubviews() {
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveNoteButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupButtonAction() {
        saveNoteButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self = self else { return }
                    if let title = self.titleLabelField.text, let note = self.textLabelField.text {
                        self.delegate?.addNewNotes(title: title, noteText: note)
                    }
                    self.dismiss(animated: true, completion: nil)                }
            ),
            for: .touchUpInside
        )
    }
}

