//
//  ViewController.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        store.fetchPeople {
            (peopleResult) -> Void in
            
            switch peopleResult {
            case let .success(people):
                print("successfully found \(people.count) people.")
                if let firstPerson = people.first {
                    self.personLabel.text = firstPerson.name
                }
            case let .failure(error):
                print("Error fetching people: \(error)")
            }
        }
    }

    @IBOutlet var personLabel: UILabel!
    var store: APIStore = APIStore()


}

