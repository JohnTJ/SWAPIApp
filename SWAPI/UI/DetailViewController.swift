//
//  DetailViewController.swift
//  SWAPI
//
//  Created by John Jones on 5/29/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person!
    
    override func viewDidLoad() {
        print("detail view controller loading")
        self.title = person.name
        
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var massLabel: UILabel!
    @IBOutlet var hairColorLabel: UILabel!
    @IBOutlet var skinColorLabel: UILabel!
    @IBOutlet var eyeColorLabel: UILabel!
    @IBOutlet var birthYearLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = person.name
        heightLabel.text = "\(person.height) cm"
        massLabel.text = "\(person.mass) kgs"
        hairColorLabel.text = person.hairColor
        skinColorLabel.text = person.skinColor
        eyeColorLabel.text = person.eyeColor
        birthYearLabel.text = person.birthYear
        genderLabel.text = person.gender
    }
}
