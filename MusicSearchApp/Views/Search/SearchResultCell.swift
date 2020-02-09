//
//  SearchCell.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    static let reuseID = "SearchResultCell"
    
    private let padding: CGFloat = 16
    private let logoImageSize: CGFloat = 64
    private let cornerRadius: CGFloat = 12
    
    private lazy var nameLabel = UILabel()
    private lazy var categoryLabel = UILabel()
    private lazy var ratingLabel = UILabel()
    private lazy var getButton = UIButton(type: .system)
    
    private lazy var infoTopStackView = UIStackView()
    private lazy var infoBottomStackView = UIStackView()
    private lazy var labelsStackView = VerticalStackView(arrangedSubViews: [nameLabel, categoryLabel, ratingLabel])
    private lazy var overallStackView = VerticalStackView(arrangedSubViews: [infoTopStackView, infoBottomStackView], spacing: padding)
    
    
    private lazy var imageLogoView = UIImageView()
    private lazy var screenshot1ImageView = self.createScreenshotImageView()
    private lazy var screenshot2ImageView = self.createScreenshotImageView()
    private lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureOverallStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSearchResult (result: Result) {
        nameLabel.text = result.trackName
        categoryLabel.text = result.primaryGenreName
        ratingLabel.text = "Rating: \(result.averageUserRating ?? 0)"
        imageLogoView.sd_setImage(with: URL(string: result.artworkUrl100))
        
        switch result.screenshotUrls.count {
            
        case  1:
            screenshot1ImageView.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            
        case  2:
            screenshot1ImageView.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            screenshot2ImageView.sd_setImage(with: URL(string: result.screenshotUrls[1]))
            
            
        case 3:
            screenshot1ImageView.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            screenshot2ImageView.sd_setImage(with: URL(string: result.screenshotUrls[1]))
            screenshot3ImageView.sd_setImage(with: URL(string: result.screenshotUrls[2]))
        default:
            screenshot1ImageView.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            screenshot2ImageView.sd_setImage(with: URL(string: result.screenshotUrls[1]))
            screenshot3ImageView.sd_setImage(with: URL(string: result.screenshotUrls[2]))
        }
    }
    
    private func configureOverallStackView () {
        addSubview(overallStackView)
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        
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
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
    }
    
    private func configureImageLogoView() {
        imageLogoView.translatesAutoresizingMaskIntoConstraints = false
        imageLogoView.backgroundColor = .red
        imageLogoView.layer.cornerRadius = cornerRadius
        imageLogoView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageLogoView.widthAnchor.constraint(equalToConstant: logoImageSize),
            imageLogoView.heightAnchor.constraint(equalToConstant: logoImageSize)
        ])
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
        imageView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.75)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
