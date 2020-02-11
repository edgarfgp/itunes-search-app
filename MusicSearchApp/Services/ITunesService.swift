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
    
    
    func fetchSocialApp(completed: @escaping  ([SocialResult]?, Error?) -> Void) {
        
        fetchGenericJSONSata(urlString: UrlConstants.social, completion: completed)
    }
    
    func getAppData (searchTerm: String, completed: @escaping  (SearchResult?, Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        
        fetchGenericJSONSata(urlString: urlString, completion: completed)
    }
    
    func fetchAppsWeLove(completed : @escaping (AppResult?, Error?) -> Void) {
                
        fetchGenericJSONSata(urlString: UrlConstants.newAppsWeLove, completion: completed)
    }
    
    func fetchTopGrossing(completed : @escaping (AppResult?, Error?) -> Void) {
        
        fetchGenericJSONSata(urlString: UrlConstants.topGrossing, completion: completed)
    }
    
    func fetchTopGames(completed : @escaping (AppResult?, Error?) -> Void) {
                
        fetchGenericJSONSata(urlString: UrlConstants.newGamesWeLove, completion: completed)
    }
    
    func fetchGenericJSONSata<T: Decodable>(urlString: String, completion:  @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch app", error)
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                
                completion(result, nil)
                
            }catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil, jsonError)
            }
            
            
        }.resume()
    }
}
