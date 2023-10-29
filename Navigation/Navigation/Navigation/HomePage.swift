
import UIKit

enum OpeningMode {
    case navigation, present
}

class HomePage: UIViewController {
    
    private let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present color palette", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        button.layer.shadowOpacity = 0.56
        return button
    }()
    
    private let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push color Palette", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        button.layer.shadowOpacity = 0.56
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setuppushTocolorPageButton()
        setuppresentColorPageButton()
        
        var buttons = [UIButton]()
        buttons.append(presentButton)
        buttons.append(pushButton)
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .vertical
        stack.spacing = 12
        stack.distribution = .fillEqually
        
        let mainStack = UIStackView(arrangedSubviews: [stack])
        mainStack.axis = .vertical
        mainStack.alignment = .top
        mainStack.spacing = 40
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 100),
            presentButton.widthAnchor.constraint(equalToConstant: 260),
            pushButton.heightAnchor.constraint(equalToConstant: 100),
            pushButton.widthAnchor.constraint(equalToConstant: 260),
        ])
    }
    
    //MARK: Setup
    private func setuppushTocolorPageButton() {
        presentButton.addAction(UIAction(handler: { [weak self] action in
            self?.pushTocolorPage()
        }), for: .touchUpInside)
    }
    
    private func setuppresentColorPageButton() {
        pushButton.addAction(UIAction(handler: { [weak self] action in
            self?.presentColorPage()
        }), for: .touchUpInside)
    }
    
    //MARK: Navigation
    private func pushTocolorPage() {
        let colorPage = ColorPalette()
        colorPage.selectionDelegate = self
        present(colorPage, animated: true)
    }
    
    private func presentColorPage() {
        let colorPage = ColorPalette()
        colorPage.selectionDelegate = self
        navigationController?.pushViewController(colorPage, animated: true)
    }
}

extension HomePage: ColorChagngerDelegate {
    func didBGChoice(isBG: Bool, color: UIColor) {
        view.backgroundColor = isBG ? color : view.backgroundColor
    }
    
    func didBTNChoice(isBG: Bool, color: UIColor) {
        presentButton.backgroundColor = !isBG ? color : presentButton.backgroundColor
        pushButton.backgroundColor = !isBG ? color : pushButton.backgroundColor
    }
}
