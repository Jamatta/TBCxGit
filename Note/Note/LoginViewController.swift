//
//  LoginViewController.swift
//  Note
//
//  Created by Nika Jamatashvili on 05.11.23.
//

import UIKit
import Security

class LoginViewController: UIViewController {
    
    private let contentWrapperStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 32
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let inputsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .trailing
        stackview.distribution = .fill
        stackview.spacing = 16
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = whiteColor
        textField.backgroundColor = blackColor
        textField.layer.borderWidth = 0.2
        textField.layer.borderColor = greyColor.cgColor
        textField.layer.cornerRadius = 8
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightText
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: placeholderAttributes)
        
        return textField
    }()
    
    private let passTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = whiteColor
        textField.backgroundColor = blackColor
        textField.layer.borderWidth = 0.2
        textField.layer.borderColor = greyColor.cgColor
        textField.layer.cornerRadius = 8
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightText
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: placeholderAttributes)
        
        return textField
    }()
    
    private let buttonStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.backgroundColor = greenColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = blackColor
        view.addSubview(contentWrapperStackView)
        contentWrapperStackViewSetup()
        constraintSetup()
        setupPushToNoteListVCButton()
        saveUsernameAndPasswordToKeychain()
        retrievePasswordFromKeychain()
    }
    
    private func constraintSetup() {
        
        NSLayoutConstraint.activate([
            contentWrapperStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentWrapperStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            contentWrapperStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            inputsStackView.leadingAnchor.constraint(equalTo: contentWrapperStackView.leadingAnchor),
            inputsStackView.trailingAnchor.constraint(equalTo: contentWrapperStackView.trailingAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: inputsStackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: inputsStackView.trailingAnchor),
            
            passTextField.leadingAnchor.constraint(equalTo: inputsStackView.leadingAnchor),
            passTextField.trailingAnchor.constraint(equalTo: inputsStackView.trailingAnchor),
            
            button.leadingAnchor.constraint(equalTo: inputsStackView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: inputsStackView.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            passTextField.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func contentWrapperStackViewSetup() {
        contentWrapperStackView.addArrangedSubview(inputsStackView)
        contentWrapperStackView.addArrangedSubview(buttonStackView)
        
        inputsStackView.addArrangedSubview(emailTextField)
        inputsStackView.addArrangedSubview(passTextField)
        
        buttonStackView.addArrangedSubview(button)
    }
    
    private func setupPushToNoteListVCButton() {
        button.addAction(UIAction(handler: { [weak self] action in
            self?.pushToNoteListVC()
        }), for: .touchUpInside)
    }
    
    private func pushToNoteListVC() {
        let noteListVC = NoteListViewController()
        navigationController?.pushViewController(noteListVC, animated: true)
        checkIfCredentialsExist()
    }
    
    private func saveUsernameAndPasswordToKeychain() {
        if let username = emailTextField.text, let password = passTextField.text {
            KeychainManager.shared.saveUsernameAndPassword(username: username, password: password)
        }
    }
    
    private func retrievePasswordFromKeychain() {
        if let username = emailTextField.text, let password = KeychainManager.shared.getPasswordForUsername(username: username) {
            passTextField.text = password
        }
    }
    
    private func checkIfCredentialsExist() {
        if let username = emailTextField.text, let password = KeychainManager.shared.getPasswordForUsername(username: username) {
            print("აქ იყო ერმალოს ძმაკაცი")
        }
    }
    
}

class KeychainManager {
    static let shared = KeychainManager()
    
    private let serviceName = "NotesApp"
    
    func saveUsernameAndPassword(username: String, password: String) {
        guard let data = password.data(using: .utf8) else {
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: username,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Error saving to Keychain: \(status)")
        }
    }
    
    func getPasswordForUsername(username: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: username,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess, let data = dataTypeRef as? Data {
            if let password = String(data: data, encoding: .utf8) {
                return password
            }
        }
        
        return nil
    }
}
