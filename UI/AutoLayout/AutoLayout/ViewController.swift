//
//  ViewController.swift
//  AutoLayout
//
//  Created by Nika Jamatashvili on 24.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var header: UIStackView!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var bottomWrapperStackView: UIStackView!
    @IBOutlet private weak var lableName: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    @IBOutlet private weak var priceLable: UILabel!
    @IBOutlet private weak var ratingLable: UILabel!
    @IBOutlet private weak var mainCTAButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainStackView()
        setupMainImageView()
        setupBottomWrapper()
        setupCoffeeArray()
    }
    
    private func setupMainStackView() {
        mainStackView.setCustomSpacing(24, after: header)
    }
    
    private func setupMainImageView() {
        mainImageView.layer.cornerRadius = 16
    }
    
    private func setupMainCTAButton() {
        mainCTAButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }
    
    private func setupBottomWrapper() {
        
        bottomWrapperStackView.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        bottomWrapperStackView.layer.shadowOpacity = 0.32
        bottomWrapperStackView.layer.shadowRadius = 12
        bottomWrapperStackView.layer.shadowOffset = CGSize(width: 0, height: -10)
    }
    
    struct Coffee {
        let name: String
        let withChocolate: Bool
        let price: Double
        let rating: Double
        let description: String
    }
    
    var coffeeArray: [Coffee] = []
    
    private func setupCoffeeArray() {
        
        let naleqiani = Coffee(name: "Naleqiani", withChocolate: false, price: 3.49, rating: 5.0, description: "A smooth naleqiani coffee with a medium roast, A smooth naleqiani coffee with a medium roastA smooth naleqiani coffee with a medium roastA smooth naleqiani coffee with a medium roast")
        let rastvarimi = Coffee(name: "Rastvarimi", withChocolate: false, price: 2.99, rating: 4.9, description: "A rich and bold rastvarimi with a strong flavor")
        
        coffeeArray = [naleqiani, rastvarimi]
        
        lableName.text = coffeeArray[0].name
        descriptionLable.text = coffeeArray[0].description
        priceLable.text = "$ \(coffeeArray[0].price)"
        ratingLable.text = String(coffeeArray[0].rating)
    }
    
}
