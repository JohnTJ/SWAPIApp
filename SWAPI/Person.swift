//
//  Person.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation

class Person {
    let birthYear: String
    let gender: String
    let name: String
    let remoteURL: URL
    
    init(birthYear: String, gender: String, name: String, remoteURL: URL) {
        self.birthYear = birthYear
        self.gender = gender
        self.name = name
        self.remoteURL = remoteURL
    }
    
    
}
