//
//  HomePageViewController.swift
//  Animations
//
//  Created by Nika Jamatashvili on 12.11.23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.alpha = 0.0
        label.textColor = UIColor(red: 0.19, green: 0.9, blue: 0.78, alpha: 1)
        return label
    }()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("მეორე ანიმაციაი", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myLabel)
        view.addSubview(myButton)
        view.backgroundColor = .white
        
        setupLabelConstraints()
        animateLabel()
        setupButtonConstraints()
    }
    
    //MARK: Setup
    private func setupLabelConstraints() {
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupButtonConstraints() {
            myButton.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                myButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            ])
        }
    
    //MARK: Fade in and Transform Animation
    private func animateLabel() {
        UIView.animate(withDuration: 1.2, delay: 0.0, options: [.curveLinear, .autoreverse, .repeat], animations: {
            
            self.myLabel.alpha = 1.0
            self.myLabel.transform = CGAffineTransform(translationX: 0, y: -24)
        }, completion: nil)
    }
    
    @objc private func buttonTapped() {
        let secondVC = SecondAnimationViewController()
                navigationController?.pushViewController(secondVC, animated: true)
    }
}
