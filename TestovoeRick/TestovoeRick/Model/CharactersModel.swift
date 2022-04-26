//
//  Model.swift
//  TestovoeRick
//
//  Created by Kalandarov Vakil on 16.04.2022.
//

import Foundation

struct CharactersModel : Codable {
    var info: Info
    var results: [Results]
}

struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

struct Results: Codable {
    var name: String
    var species: String
    var gender: String
    var image: String
    var episode: [String]
    let location: Location
}

struct Location: Codable {
    let name: String
}

