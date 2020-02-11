//
//  AppsHeaderHorizontalController.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHeaderHorizontalController: BaseListController {
    
    var socialApps = [SocialResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.reuseID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppHeaderCell.reuseID, for: indexPath) as! AppHeaderCell
        
        let result = socialApps[indexPath.item]
        
        cell.companyLabel.text = result.name
        cell.titleLabel.text = result.tagline
        cell.imageView.sd_setImage(with: URL(string: result.imageUrl))
        return cell
    }
}

extension AppsHeaderHorizontalController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48 , height: view.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
