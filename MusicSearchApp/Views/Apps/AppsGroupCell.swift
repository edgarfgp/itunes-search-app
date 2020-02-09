//
//  AppCell.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    static let reuseID = "AppsCell"
    
     let horizontalController = AppsHorizontalController()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(titleLabel)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
