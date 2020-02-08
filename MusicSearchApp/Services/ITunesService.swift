//
//  ITunesService.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 08/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class ITunesService {
    static let shared = ITunesService()
    
    func getAppData (searchTerm: String, completed: @escaping  ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch app", error)
                completed([], error)
                return
            }
            
            guard let data = data else { return }
            // print(String(data: data!, encoding: .utf8))
            do {
                let rearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completed(rearchResult.results, nil)
            
            }catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completed([], jsonError)
            }
        }.resume()
    }
}
