//
//  FactViewController.swift
//  catFact
//
//  Created by Nika Jamatashvili on 24.11.23.
//

import UIKit

final class CatFactCell: UITableViewCell {
    
    var factLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        UINavigationBar.appearance()
        
        addSubview(factLabel)
        
        configureTitleLabel()
        setTitleLabelConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        factLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with fact: Fact) {
        factLabel.text = fact.fact
    }
    
    private func configureTitleLabel() {
        factLabel.numberOfLines = 0
        factLabel.adjustsFontSizeToFitWidth = true
        factLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setTitleLabelConstraints() {
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            factLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            factLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            factLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
