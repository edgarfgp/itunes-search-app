//
//  AppRowCell.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit
import SDWebImage


class AppRowCell: UICollectionViewCell {
    
    static let reuseID = "AppRowCell"
    
    private let padding: CGFloat = 16
    private let logoImageSize: CGFloat = 64

    var nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 20))
    var companyLabel = UILabel(text: "App name", font: .systemFont(ofSize: 13))
    var getButton = UIButton(title: "GET")
    var imageView = UIImageView(cornerRadius: 8)
    
    private lazy var overallStackView = UIStackView(arrangedSubviews: [
        imageView,
        VerticalStackView(arrangedSubViews: [nameLabel, companyLabel], spacing: 4),
        getButton
    ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(overallStackView)
        configureOverallStackView()
        configureImageView()
        configureGetButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(result : FeedResult){
        nameLabel.text = result.name
        imageView.sd_setImage(with: URL(string: result.artworkUrl100))
    }
    
    private func configureOverallStackView() {
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.spacing = 12
        overallStackView.alignment = .center
        
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: self.topAnchor),
            overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureImageView() {
        imageView.backgroundColor = .systemGray
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: logoImageSize),
            imageView.heightAnchor.constraint(equalToConstant: logoImageSize)
        ])
    }
    
    private func configureGetButton() {
        getButton.backgroundColor = UIColor.gray.withAlphaComponent(0.15)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        NSLayoutConstraint.activate([
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
}
