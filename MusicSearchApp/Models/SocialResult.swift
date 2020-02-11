//
//  SocialResult.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 11/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

struct SocialResult : Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let tagline: String
}
