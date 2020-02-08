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
    
    private lazy var infoTopStackView = UIStackView()
    private lazy var labelsStackView = UIStackView()
    private lazy var overallStackView = UIStackView()
    private lazy var infoBottomStackView = UIStackView()
    
    private lazy var imageLogoView = UIImageView()
    private lazy var screenshot1ImageView = self.createScreenshotImageView()
    private lazy var screenshot2ImageView = self.createScreenshotImageView()
    private lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    private lazy var nameLabel = UILabel()
    private lazy var categoryLabel = UILabel()
    private lazy var ratingLabel = UILabel()
    private lazy var getButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOverallStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureOverallStackView () {
        addSubview(overallStackView)
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        
        overallStackView.addArrangedSubview(infoTopStackView)
        overallStackView.addArrangedSubview(infoBottomStackView)
        overallStackView.axis = .vertical
        overallStackView.spacing = 12
        
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: self.topAnchor),
            overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
        
        configureInfoTopStackView()
        configureInfoBottomStackView()
    }
    
    private func configureInfoTopStackView() {
        infoTopStackView.translatesAutoresizingMaskIntoConstraints = false
        infoTopStackView.addArrangedSubview(imageLogoView)
        infoTopStackView.addArrangedSubview(labelsStackView)
        infoTopStackView.addArrangedSubview(getButton)
        infoTopStackView.axis = .horizontal
        infoTopStackView.spacing  = 12
        infoTopStackView.alignment = .center
        
        configureLabelsStackView()
        configureImageLogoView()
        configureGetButton()
    }
    
    private func configureInfoBottomStackView() {
        infoBottomStackView.translatesAutoresizingMaskIntoConstraints = false
        screenshot1ImageView.translatesAutoresizingMaskIntoConstraints = false
        screenshot2ImageView.translatesAutoresizingMaskIntoConstraints = false
        screenshot3ImageView.translatesAutoresizingMaskIntoConstraints = false
        
        infoBottomStackView.addArrangedSubview(screenshot1ImageView)
        infoBottomStackView.addArrangedSubview(screenshot2ImageView)
        infoBottomStackView.addArrangedSubview(screenshot3ImageView)
        infoBottomStackView.axis = .horizontal
        infoBottomStackView.spacing = 12
        infoBottomStackView.distribution = .fillEqually
        
    }
    
    private func configureLabelsStackView () {
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(categoryLabel)
        labelsStackView.addArrangedSubview(ratingLabel)
        
        configureNameLabel()
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
    
    private func configureImageLogoView() {
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
    
    private func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        return imageView
    }
}
