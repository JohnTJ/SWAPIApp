//
//  ViewController.swift
//  SWAPI
//
//  Created by John Jones on 5/23/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var apiStore: APIStore = APIStore()
    let personDataSource = PersonDataSource()
    
    func updateWithResult(_ newResult: PeopleResult) {
    
        switch newResult {
        case let .success(result):
            self.personDataSource.people.append(contentsOf: result.results)
            if result.hasNext {
                self.fetch(page: String((result.nextURL?.absoluteString.last!)!))
            }
        case let .failure(error):
            print("Error fetching people: \(error)")
        }
        self.tableView.reloadData()
    }
    
    func fetch(page: String) {
        apiStore.fetchPeople(pageNumber: page, completion: { (peopleResult) -> Void in
            self.updateWithResult(peopleResult)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = personDataSource
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
        fetch(page: "1")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "ShowPerson"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let person = personDataSource.people[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.person = person
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    // Delegate method
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row > 85) {
            print("Greater than 3")
        }
    }
}


