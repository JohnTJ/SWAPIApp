//
//  SwapiAPI.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation

enum SwapiError: Error {
    case invalidJSONData
}

enum EndPoint: String {
    case people = "people"
    case planets = "planets"
    case starships = "starships"
    case films = "films"
}

struct SwapiAPI {
    
    private static let baseURLString = "https://swapi.co/api/"
    private static var baseURL: URL { return URL(string: baseURLString)! }
    
    static var peopleURL: URL {
        return swapiURL(endPoint: .people)
    }
    
    static var planetsURL: URL {
        return swapiURL(endPoint: .planets)
    }
    
    static var starshipsURL: URL {
        return swapiURL(endPoint: .starships)
    }
    
    private static func swapiURL(endPoint: EndPoint) -> URL {
        return baseURL.appendingPathComponent(endPoint.rawValue)
    }
    
    static func people(fromJSON data: Data) -> PeopleResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let peopleArray = jsonDictionary["results"] as? [[String:Any]] else {
                    
                    print("problem!")
                
                    // The JSON structure doesn't match our expectations
                    return .failure(SwapiError.invalidJSONData)
            }
            
            var finalPeople = [Person]()
            for personJSON in peopleArray {
                if let person = person(fromJSON: personJSON) {
                    finalPeople.append(person)
                }
            }
            
            if finalPeople.isEmpty && !peopleArray.isEmpty {
                return .failure(SwapiError.invalidJSONData)
            }
            return .success(finalPeople)
        } catch let error {
            return .failure(error)
        }
    }
    
    private static func person(fromJSON json: [String:Any]) -> Person? {
        guard
            let birthYear = json["birth_year"] as? String,
            let gender = json["gender"] as? String,
            let name = json["name"] as? String,
            let personURLString = json["url"] as? String,
            let url = URL(string: personURLString) else {
                
                // Don't have enough information to construct a Person
                return nil
        }
        return Person(birthYear: birthYear, gender: gender, name: name, remoteURL: url)
    }
}
