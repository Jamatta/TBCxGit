
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

private let blueColor = UIColor(hex: "#22577A")

class ViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradientBG")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let contentWrapperStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 32
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let avatarStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 16
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatarImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
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
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.7, alpha: 0.25)
        return textField
    }()
    
    private let passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.7, alpha: 0.25)
        
        return textField
    }()
    
    private let textButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Your Password?", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        button.backgroundColor = blueColor
        button.layer.cornerRadius = 22
        return button
    }()
    
    private let alternateMethodsStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 12
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let separatorStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let separatorLine: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .darkGray
        return stackview
    }()
    
    private let separatorLine2: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .darkGray
        return stackview
    }()
    
    private let separatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let socialsStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 12
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "google")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 12
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let facebookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "facebook")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 12
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let linkedInImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "linkedIn")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 12
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    private let helperLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account. Sign Up"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
        view.addSubview(contentWrapperStackView)
        contentWrapperStackViewSetup()
        constraintSetup()
        setuppushToHomePageButton()
    }
    
    private func constraintSetup() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentWrapperStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            contentWrapperStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            contentWrapperStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
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
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            separatorLine.widthAnchor.constraint(equalToConstant: 110),
            separatorLine2.heightAnchor.constraint(equalToConstant: 1),
            separatorLine2.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
    
    private func contentWrapperStackViewSetup() {
        
        contentWrapperStackView.addArrangedSubview(avatarStackView)
        contentWrapperStackView.addArrangedSubview(inputsStackView)
        contentWrapperStackView.addArrangedSubview(buttonStackView)
        contentWrapperStackView.addArrangedSubview(alternateMethodsStack)
        avatarStackView.addArrangedSubview(avatarImageView)
        avatarStackView.addArrangedSubview(label)
        inputsStackView.addArrangedSubview(emailTextField)
        inputsStackView.addArrangedSubview(passTextField)
        inputsStackView.addArrangedSubview(textButton)
        buttonStackView.addArrangedSubview(button)
        alternateMethodsStack.addArrangedSubview(separatorStack)
        separatorStack.addArrangedSubview(separatorLine)
        separatorStack.addArrangedSubview(separatorLabel)
        separatorStack.addArrangedSubview(separatorLine2)
        alternateMethodsStack.addArrangedSubview(socialsStack)
        socialsStack.addArrangedSubview(googleImage)
        socialsStack.addArrangedSubview(facebookImage)
        socialsStack.addArrangedSubview(linkedInImage)
        alternateMethodsStack.addArrangedSubview(helperLabel)
        alternateMethodsStack.setCustomSpacing(64, after: socialsStack)
    }
    
    //MARK: Setup
    private func setuppushToHomePageButton() {
        button.addAction(UIAction(handler: { [weak self] action in
            self?.pushToHomePage()
        }), for: .touchUpInside)
    }
    
    //MARK: Navigation
    private func pushToHomePage() {
        let homePage = HomePage()
        navigationController?.pushViewController(homePage, animated: true)
    }
}
