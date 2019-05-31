//
//  QueryResult.swift
//  SWAPI
//
//  Created by John Jones on 5/30/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation

struct QueryResult<T> where T: Codable {
    var count: Int
    var nextURL: URL?
    var previousURL: URL?
    var results: Array<T>
    
    enum CodingKeys: String, CodingKey {
        case count, nextURL = "next", previousURL = "previous", results
    }
}

extension QueryResult {
    var hasNext: Bool { return nextURL != nil }
    var hasPrevious: Bool { return previousURL != nil }
}

extension QueryResult: Codable {
    
}
