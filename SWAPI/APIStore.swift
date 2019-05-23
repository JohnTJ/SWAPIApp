//
//  PersonStore.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

enum PersonError: Error {
    case personCreationError
}

enum PeopleResult {
    case success([Person])
    case failure(Error)
}

class APIStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchPeople(completion: @escaping (PeopleResult) -> Void) {
        let url = SwapiAPI.peopleURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processPeopleRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        
        task.resume()
    }
    
    private func processPeopleRequest(data: Data?, error: Error?) -> PeopleResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return SwapiAPI.people(fromJSON: jsonData)
    }
    
}
