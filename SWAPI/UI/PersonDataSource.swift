//
//  PersonDataSource.swift
//  SWAPI
//
//  Created by John Jones on 5/29/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class PersonDataSource: NSObject, UITableViewDataSource {
    
    var people = [Person]()
    
    var pages = [URL]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "PersonCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonCell
        cell.nameLabel.text = people[indexPath.row].name
        cell.genderLabel.text = (people[indexPath.row].gender).uppercased()
        cell.massLabel.text = "\(people[indexPath.row].mass)kgs"
        // print("We here \(people[indexPath.row].name)")
        return cell
    }
}
