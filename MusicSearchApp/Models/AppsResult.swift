//
//  AppsResult.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 09/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

struct AppResult : Decodable {
    let feed : Feed
}

struct Feed : Decodable {
    let title : String
    let results : [FeedResult]
}

struct FeedResult : Decodable {
    let name : String
    let artistName : String
    let artworkUrl100 : String
}
