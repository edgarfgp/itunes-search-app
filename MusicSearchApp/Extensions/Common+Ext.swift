//
//  Extensions.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text : String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}


extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

fileprivate var contentView : UIView!

extension UIViewController {
    
    func showLoadingView() {
        contentView = UIView(frame: view.bounds)
        view.addSubview(contentView)
        
        contentView.backgroundColor = .systemBackground
        contentView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { contentView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        contentView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dissmissLoadingView(){
        DispatchQueue.main.async {
            contentView.removeFromSuperview()
            contentView = nil
        }
    }

}
