//
//  SecondAnimationViewController.swift
//  Animations
//
//  Created by Nika Jamatashvili on 13.11.23.
//

import UIKit

class SecondAnimationViewController: UIViewController {

    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(secondLabel)

        setupLabelConstraints()
        performCircularAnimation()
        performRotationAnimation()
        animateGradientBackground()
    }

    // MARK: Setup
    private func setupLabelConstraints() {
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    // MARK: Transform Animation
    private func performCircularAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.1
        animation.toValue = 1.0
        animation.duration = 1.2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

        secondLabel.layer.add(animation, forKey: "scaleAnimation")
    }

    // MARK: Rotation Animation
    private func performRotationAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 8.0 // დურეიშენი 0 გაუწერე და ეს ჩართე ბეგრაუნდად https://www.youtube.com/watch?v=a0DbzUe-r4Q
        rotationAnimation.repeatCount = .greatestFiniteMagnitude

        secondLabel.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }

    // MARK: Gradient Background Animation
    private func animateGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: -2, y: -2)
        gradientLayer.endPoint = CGPoint(x: 2, y: 2)
        view.layer.insertSublayer(gradientLayer, at: 0)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        animation.toValue = [UIColor.green.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
        animation.autoreverses = true
        animation.duration = 5.0
        animation.repeatCount = .greatestFiniteMagnitude
        gradientLayer.add(animation, forKey: "gradientAnimation")
    }
}


