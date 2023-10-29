//
//  AddNewItemToListViewController.swift
//  Spotifui
//
//  Created by Nika Jamatashvili on 29.10.23.
//

import UIKit

protocol AddNewMusicInArray: AnyObject {
    func addNewMusic(title: String, image: UIImage)
}

class AddNewItemToListViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    weak var addNewMusic: AddNewMusicInArray?
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    private let uploadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Upload Image", for: .normal)
        button.addTarget(self, action: #selector(uploadImageTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let musicTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Music title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Music", for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var selectedImage: UIImage? {
        didSet {
            placeholderImageView.image = selectedImage
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        contentStackView.addArrangedSubview(placeholderImageView)
        contentStackView.addArrangedSubview(uploadImageButton)
        contentStackView.addArrangedSubview(musicTitleTextField)
        contentStackView.addArrangedSubview(addButton)
        
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        addButton.addAction(UIAction(handler: { [weak self] action in
            self?.addButtonTapped()
        }), for: .touchUpInside)
    }
    
    @objc func uploadImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @objc func addButtonTapped() {
        if let title = musicTitleTextField.text, !title.isEmpty, let image = selectedImage {
            addNewMusic?.addNewMusic(title: title, image: image)
            dismiss(animated: true, completion: nil)
        } else {
            print("Title is required")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
