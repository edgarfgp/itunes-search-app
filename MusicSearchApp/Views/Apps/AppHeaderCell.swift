//
//  AppHeaderCell.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    static let reuseID = "AppHeaderCell"
    
    private lazy var companyLabel = UILabel(text: "Facebook", font: UIFont.systemFont(ofSize: 12))
    
    private lazy var titleLabel = UILabel(text: "Keeping up with friend is faster that ever.", font: UIFont.systemFont(ofSize: 20))
    
    private lazy var imageView = UIImageView(cornerRadius: 8)
    
    private lazy var stackView = VerticalStackView(arrangedSubViews: [ companyLabel, titleLabel, imageView ], spacing: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        stackView.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.textColor = .blue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        
        titleLabel.numberOfLines = 2
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
