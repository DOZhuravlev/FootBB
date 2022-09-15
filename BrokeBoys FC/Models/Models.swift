//
//  Model.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 23.08.2022.
//

enum Collection: String {
    case players
    case matches
    case merch
    case news
}

struct Player: Decodable {
    
    let aboutPlayer: String?
    let instagram: String?
    let name: String
    let picture: String
    let telegram: String?
    let wiki: String?
    let youtube: String?
}

struct News: Decodable {
    let headerNews: String
    let image: String
    let isNews: Bool
    let isNewsWithButton: Bool
    let isVideo: Bool
    let textNews: String
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
