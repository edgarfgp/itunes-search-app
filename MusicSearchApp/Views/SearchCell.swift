//
//  SearchCell.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    static let reuseID = "SearchCell"
    
    private let padding: CGFloat = 16
    private let logoImageSize: CGFloat = 64
    private let cornerRadius: CGFloat = 12
    
    private lazy var containerView = UIStackView()
    private lazy var labelsStackView = UIStackView()
    private lazy var imageLogoView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var categoryLabel = UILabel()
    private lazy var ratingLabel = UILabel()
    private lazy var getButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        configureStackView()
        configureInnerStackView()
        configureImageLogo()
        configureNameLabel()
        configureGetButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        containerView.addArrangedSubview(imageLogoView)
        containerView.addArrangedSubview(labelsStackView)
        containerView.addArrangedSubview(getButton)
        containerView.spacing  = 12
        containerView.alignment = .center
        addSubview(containerView)
        containerView.constraintToEdges(of: self, constant: padding)
    }
    
    private func configureInnerStackView () {
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(categoryLabel)
        labelsStackView.addArrangedSubview(ratingLabel)
        
        configureCategoryLabel()
        configureRatingLabel()
    }
    
    private func configureCategoryLabel() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.text = "Photo & Video"
    }
    
    private func configureRatingLabel() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "9.26M"
    }
    
    private func configureImageLogo() {
        imageLogoView.translatesAutoresizingMaskIntoConstraints = false
        imageLogoView.backgroundColor = .red
        imageLogoView.layer.cornerRadius = cornerRadius
        
        NSLayoutConstraint.activate([
            imageLogoView.widthAnchor.constraint(equalToConstant: logoImageSize),
            imageLogoView.heightAnchor.constraint(equalToConstant: logoImageSize)
        ])
    }
    
    private func configureNameLabel () {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "My label"
    }
    
    private func configureGetButton() {
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.systemBlue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.backgroundColor = UIColor.gray.withAlphaComponent(0.15)
        getButton.layer.cornerRadius = cornerRadius
        
        NSLayoutConstraint.activate([
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
