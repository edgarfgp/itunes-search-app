//
//  SearchVC.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class SearchVC: UICollectionViewController {
    
    private var appResults = [Result]()
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
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.reuseID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchtermLabel.isHidden = appResults.count > 1
        
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseID, for: indexPath) as! SearchCell
        let appResult = appResults[indexPath.item]
        cell.set(result: appResult)
        return cell
    }
    
    init() {
        super.init(collectionViewLayout : UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getItuneAppsData() {
        ITunesService.shared.getAppData(searchTerm: "Twiter")  { results, error in
            self.appResults = results
            
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

extension SearchVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

extension SearchVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            
            ITunesService.shared.getAppData(searchTerm: searchText) { results, error in
                self.appResults = results
                
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
