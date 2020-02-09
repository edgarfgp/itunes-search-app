//
//  AppsPageHeader.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    static let reuseID = "AppsPageHeader"
    
    let appHeaderHorizontalController =  AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        appHeaderHorizontalController.view.backgroundColor = .purple
        appHeaderHorizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(appHeaderHorizontalController.view)
        
        NSLayoutConstraint.activate([
            appHeaderHorizontalController.view.topAnchor.constraint(equalTo: topAnchor),
            appHeaderHorizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appHeaderHorizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appHeaderHorizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
