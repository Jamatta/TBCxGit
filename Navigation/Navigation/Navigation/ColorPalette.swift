
import UIKit

private let paleLeaf = UIColor(hex: "#CCD4BF")
private let vurlyWood = UIColor(hex: "#E7CBA9")
private let zinnwaldite = UIColor(hex: "#EEBAB2")
private let ecruWhite = UIColor(hex: "#F5F3E7")
private let vanillaIce = UIColor(hex: "#F5E2E4")
private let jungleMist = UIColor(hex: "#A1CDCE")

protocol ColorChagngerDelegate: AnyObject {
    func didBGChoice(isBG: Bool, color: UIColor)
    func didBTNChoice(isBG: Bool, color: UIColor)
}

class ColorPalette: UIViewController {
    
    weak var selectionDelegate: ColorChagngerDelegate?
    
    private let contentWrapper: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 40
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BGColorChangerButtonsStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fill
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BGLabel: UILabel = {
        let label = UILabel()
        label.text = "Select color for Background"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    
    private let BGButtonsFirstStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .trailing
        stackview.distribution = .fillEqually
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BGButtonsSecondStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .trailing
        stackview.distribution = .fillEqually
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BGColorButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Pale Leaf", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = paleLeaf
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private let BGColorButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Vurly Wood", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = vurlyWood
        
        return button
    }()
    
    private let BGColorButton3: UIButton = {
        let button = UIButton()
        button.setTitle("Zinnwaldite", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = zinnwaldite
        
        return button
    }()
    
    private let BGColorButton4: UIButton = {
        let button = UIButton()
        button.setTitle("Vanilla Ice", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = vanillaIce
        
        return button
    }()
    
    private let BGColorButton5: UIButton = {
        let button = UIButton()
        button.setTitle("Ecru White", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = ecruWhite
        
        return button
    }()
    
    private let BGColorButton6: UIButton = {
        let button = UIButton()
        button.setTitle("Jungle Mist", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = jungleMist
        
        return button
    }()
    
    private let BTNColorChangerButtonsStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fill
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BTNLabel: UILabel = {
        let label = UILabel()
        label.text = "Select color for buttons"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let BTNButtonsFirstStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .trailing
        stackview.distribution = .fillEqually
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BTNButtonsSecondStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .trailing
        stackview.distribution = .fillEqually
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let BTNColorButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Pale Leaf", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = paleLeaf
        return button
    }()
    
    private let BTNColorButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Vurly Wood", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = vurlyWood
        return button
    }()
    
    private let BTNColorButton3: UIButton = {
        let button = UIButton()
        button.setTitle("Zinnwaldite", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = zinnwaldite
        return button
    }()
    
    private let BTNColorButton4: UIButton = {
        let button = UIButton()
        button.setTitle("Vanilla Ice", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = vanillaIce
        return button
    }()
    
    private let BTNColorButton5: UIButton = {
        let button = UIButton()
        button.setTitle("Ecru White", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = ecruWhite
        return button
    }()
    
    private let BTNColorButton6: UIButton = {
        let button = UIButton()
        button.setTitle("Jungle Mist", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = jungleMist
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupButtonsSettings()
        contentWrapperStackViewSetup()
        contentConstraintsSetup()
        
        BGColorButton1.addAction(UIAction(handler: { [weak self] action in
            self?.paleLeafforBG()
        }), for: .touchUpInside)
        
        BGColorButton2.addAction(UIAction(handler: { [weak self] action in
            self?.vurlyWoodBG()
        }), for: .touchUpInside)
        
        BGColorButton3.addAction(UIAction(handler: { [weak self] action in
            self?.zinnwalditeBG()
        }), for: .touchUpInside)
        
        BGColorButton4.addAction(UIAction(handler: { [weak self] action in
            self?.vanillaIceBG()
        }), for: .touchUpInside)
        
        BGColorButton5.addAction(UIAction(handler: { [weak self] action in
            self?.ecruWhiteBG()
        }), for: .touchUpInside)
        
        BGColorButton6.addAction(UIAction(handler: { [weak self] action in
            self?.jungleMistBG()
        }), for: .touchUpInside)
        
        BTNColorButton1.addAction(UIAction(handler: { [weak self] action in
            self?.paleLeafBTN()
        }), for: .touchUpInside)
        
        BTNColorButton2.addAction(UIAction(handler: { [weak self] action in
            self?.vurlyWoodBTN()
        }), for: .touchUpInside)
        
        BTNColorButton3.addAction(UIAction(handler: { [weak self] action in
            self?.zinnwalditeBTN()
        }), for: .touchUpInside)
        
        BTNColorButton4.addAction(UIAction(handler: { [weak self] action in
            self?.vanillaIceBTN()
        }), for: .touchUpInside)
        
        BTNColorButton5.addAction(UIAction(handler: { [weak self] action in
            self?.ecruWhiteBTN()
        }), for: .touchUpInside)
        
        BTNColorButton6.addAction(UIAction(handler: { [weak self] action in
            self?.jungleMistBTN()
        }), for: .touchUpInside)
    }
    
    private func contentWrapperStackViewSetup() {
        view.addSubview(contentWrapper)
        contentWrapper.addArrangedSubview(BGColorChangerButtonsStack)
        contentWrapper.addArrangedSubview(BTNColorChangerButtonsStack)
        
        BGColorChangerButtonsStack.addArrangedSubview(BGLabel)
        BGColorChangerButtonsStack.addArrangedSubview(BGButtonsFirstStack)
        BGColorChangerButtonsStack.addArrangedSubview(BGButtonsSecondStack)
        
        BGButtonsFirstStack.addArrangedSubview(BGColorButton1)
        BGButtonsFirstStack.addArrangedSubview(BGColorButton2)
        BGButtonsFirstStack.addArrangedSubview(BGColorButton3)
        BGButtonsSecondStack.addArrangedSubview(BGColorButton4)
        BGButtonsSecondStack.addArrangedSubview(BGColorButton5)
        BGButtonsSecondStack.addArrangedSubview(BGColorButton6)
        
        BTNColorChangerButtonsStack.addArrangedSubview(BTNLabel)
        BTNColorChangerButtonsStack.addArrangedSubview(BTNButtonsFirstStack)
        BTNColorChangerButtonsStack.addArrangedSubview(BTNButtonsSecondStack)
        
        BTNButtonsFirstStack.addArrangedSubview(BTNColorButton1)
        BTNButtonsFirstStack.addArrangedSubview(BTNColorButton2)
        BTNButtonsFirstStack.addArrangedSubview(BTNColorButton3)
        BTNButtonsSecondStack.addArrangedSubview(BTNColorButton4)
        BTNButtonsSecondStack.addArrangedSubview(BTNColorButton5)
        BTNButtonsSecondStack.addArrangedSubview(BTNColorButton6)
        
    }
    
    private func contentConstraintsSetup() {
        
        NSLayoutConstraint.activate([
            contentWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            contentWrapper.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            contentWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        BGColorChangerButtonsStack.setCustomSpacing(16, after: BGLabel)
        BTNColorChangerButtonsStack.setCustomSpacing(16, after: BTNLabel)
    }
    
    func paleLeafforBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: paleLeaf)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func vurlyWoodBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: vurlyWood)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func zinnwalditeBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: zinnwaldite)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func ecruWhiteBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: ecruWhite)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func vanillaIceBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: vanillaIce)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func jungleMistBG() {
        selectionDelegate?.didBGChoice(isBG: true, color: jungleMist)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func vurlyWoodBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: vurlyWood)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func zinnwalditeBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: zinnwaldite)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func ecruWhiteBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: ecruWhite)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func vanillaIceBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: vanillaIce)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func jungleMistBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: jungleMist)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func paleLeafBTN() {
        selectionDelegate?.didBTNChoice(isBG: false, color: paleLeaf)
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupButtonsSettings() {
        [BGColorButton1, BGColorButton2, BGColorButton3, BGColorButton4, BGColorButton5, BGColorButton6, BTNColorButton1, BTNColorButton2, BTNColorButton3, BTNColorButton4, BTNColorButton5, BTNColorButton6].forEach { button in
            button.layer.cornerRadius = 12
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 4)
            button.layer.shadowRadius = 6
            button.layer.shadowOpacity = 0.56
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.widthAnchor.constraint(equalToConstant: 110).isActive = true
        }
    }
}
