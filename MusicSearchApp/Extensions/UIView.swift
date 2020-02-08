
//
//  UiView.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraintToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func constraintToEdges(of superView: UIView, constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: constant)
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
