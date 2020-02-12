//
//  AppsVC.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController {
    
    private var groupResult = [AppResult]()
    private var socialResult = [SocialResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseID)
        //Register header
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.reuseID)
        
        getAppsData()
    }
    
    private func getAppsData(){
        
        showLoadingView()
        
        var group1 : AppResult?
        var group2 : AppResult?
        var group3 : AppResult?
        
        //Help us to sync your data together
        let dispatcgGroup = DispatchGroup()
        
         dispatcgGroup.enter()
        ITunesService.shared.fetchSocialApp { [weak self] (result, error) in
            
            dispatcgGroup.leave()
            
            guard let self = self else { return }
            
            if let error = error {
                print("Failed to fetch app :", error)
                return
            }
            
            guard let result = result else { return }
            
            self.socialResult = result
        }
        
        
        dispatcgGroup.enter()
        
        ITunesService.shared.fetchAppsWeLove { result, error in
            
            dispatcgGroup.leave()
            
            if let error = error {
                print("Failed to fetch app :", error)
                return
            }
            
            group1  = result
        }
        
        dispatcgGroup.enter()
        ITunesService.shared.fetchTopGrossing {result, error in
            
            dispatcgGroup.leave()
            
            if let error = error {
                print("Failed to fetch app :", error)
                return
            }
            
            group2 = result
        }
        
        dispatcgGroup.enter()
        ITunesService.shared.fetchTopGames { result, error in
            
            if let error = error {
                print("Failed to fetch app :", error)
                return
            }
            
            dispatcgGroup.leave()
            
            group3 = result
        }
        
        dispatcgGroup.notify(queue: .main) { [weak self] in
            
            guard let self = self else { return }
            
            self.dissmissLoadingView()
            
            if let group = group1 {
                self.groupResult.append(group)
            }
            
            if let group = group2 {
                self.groupResult.append(group)
            }
            
            if let group = group3 {
                self.groupResult.append(group)
            }
            
            self.collectionView.reloadData()
            
        }
    }
    
    //CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseID, for: indexPath) as! AppsGroupCell
        
        let appGroup = groupResult[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appResult = appGroup
        cell.horizontalController.collectionView.reloadData()
        
        cell.horizontalController.didSelecthandler = { [weak self] result in
            guard let self = self else { return }
            
            let appDetailController = AppDetailController()
            appDetailController.title = result.name
            
            self.navigationController?.pushViewController(appDetailController, animated: true)
            
            
        }
        
        return cell
    }
    
    // Page Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.reuseID, for: indexPath) as! AppsPageHeader
                
        header.appHeaderHorizontalController.socialApps = socialResult
        header.appHeaderHorizontalController.collectionView.reloadData()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

extension AppsPageController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 0, right: 0)
    }
}
