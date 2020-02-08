//
//  SearchResult.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 08/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

struct SearchResult : Decodable {
    let resultCount: Int
    let results : [Result]
}

struct Result : Decodable {
    let trackName : String
    let primaryGenreName: String
    let averageUserRating : Float?
    let screenshotUrls : [String]
    let artworkUrl100 : String
}

