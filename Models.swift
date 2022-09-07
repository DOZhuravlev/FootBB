//
//  Model.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 23.08.2022.
//

struct Player: Codable {
    
    let aboutPlayer: String?
    let instagram: String?
    let name: String
    let picture: String
    let telegram: String?
    let wiki: String?
    let youtube: String?
    
    init(
        aboutPlayer: String,
        instagram: String,
        name: String,
        picture: String,
        telegram: String,
        wiki: String,
        youtube: String
    ) {
        self.aboutPlayer = aboutPlayer
        self.instagram = instagram
        self.name = name
        self.picture = picture
        self.telegram = telegram
        self.wiki = wiki
        self.youtube = youtube
    }
    
    
}

struct News: Decodable {
    let textNews: String
    let picture: String
}

struct Match: Decodable {
    let aboutGame: String
    let awayTeamName: String
    let dateTimeGame: String
    let homeTeamName: String
    let scoreGame: String
}

struct Merch: Decodable  {
    let linkWebMerch: String
}
