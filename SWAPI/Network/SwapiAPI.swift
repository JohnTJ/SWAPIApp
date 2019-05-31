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
    
//    static var peopleURL: URL {
//        return swapiURL(endPoint: .people)
//    }
//
//    static var planetsURL: URL {
//        return swapiURL(endPoint: .planets)
//    }
//
//    static var starshipsURL: URL {
//        return swapiURL(endPoint: .starships)
//    }

    static func swapiURL(endPoint: EndPoint, pageNumber: String) -> URL {
        let base = baseURL.appendingPathComponent(endPoint.rawValue)
        if (pageNumber == "1") {
            return base
        }
        print(baseURLString + "people/?page=\(pageNumber)")
        let url = URL(string: baseURLString + "people/?page=\(pageNumber)")
        return url!
    }
    
    static func people(fromJSON data: Data) -> PeopleResult {
        do {
            let result = try JSONDecoder().decode(QueryResult<Person>.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
