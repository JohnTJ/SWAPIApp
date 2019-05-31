//
//  Person.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation

struct Person: Codable {

    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let remoteURL: URL

    enum CodingKeys: String, CodingKey {
        case name, height, mass, hairColor = "hair_color", skinColor = "skin_color", eyeColor = "eye_color", birthYear = "birth_year", gender, remoteURL = "url"
    }
}
