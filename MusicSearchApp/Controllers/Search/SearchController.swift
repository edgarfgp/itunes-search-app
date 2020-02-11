//
//  SearchVC.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class SearchController: BaseListController {
    
    private var searchResults = [Result]()
    private var timer : Timer?
    
    private let enterSearchtermLabel : UILabel = {
        let label = UILabel()
        label.text = "Please enter a search term above"
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let searchController =  UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        confifureSearchController()
        enterSearchtermLabel.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.addSubview(enterSearchtermLabel)
        
        NSLayoutConstraint.activate([
            enterSearchtermLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            enterSearchtermLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            enterSearchtermLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func confifureSearchController()  {
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.reuseID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchtermLabel.isHidden = searchResults.count > 1
        
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseID, for: indexPath) as! SearchResultCell
        let appResult = searchResults[indexPath.item]
        cell.setSearchResult(result: appResult)
        return cell
    }
    
    private func getItuneAppsData() {
        ITunesService.shared.getAppData(searchTerm: "Twiter")  { [weak self] results, error in
            
            guard let self = self else { return }
            
            if let results = results {
                self.searchResults = results.results
            }
            
            if let error = error {
                print("Failed to fetch app :", error)
                return
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension SearchController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

extension SearchController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            
            ITunesService.shared.getAppData(searchTerm: searchText) { [weak self] results, error in
                
                guard let self = self else { return }
                
                if let results = results {
                    self.searchResults = results.results
                }
                
                if let error = error {
                    print("Failed to fetch app :", error)
                    return
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
}
