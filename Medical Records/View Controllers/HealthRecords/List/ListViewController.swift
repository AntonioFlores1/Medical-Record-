//
//  ListViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

struct Allergies {
    var name: String
    var reaction: String
    var severity: String
}

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
   var defaultArray = [Allergies(name: "Milk", reaction: "rank_last_week", severity: "Severe"),
                      Allergies(name: "Paper", reaction: "rank_last_week", severity: "Mild"),
                    Allergies(name: "rank", reaction: "rank_last_week", severity: "Severe"),
                      Allergies(name: "Bees", reaction: "rank_last_week", severity: "Moderate"),
                    Allergies(name: "Pan", reaction: "rank_last_week", severity: "Mild"),
                     Allergies(name: "Sink", reaction: "rank_last_week", severity: "Moderate")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailViewController = storyboard?.instantiateViewController(identifier:  "DetailViewController") as? SearchListViewController else { //Access to DetailView
                   fatalError("Couldn't segue")
               }
        detailViewController.healthDelegate = self
    }
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
       
        
        
        
        
    }
   
        

    }

extension ListViewController: updateHealthDelegate {
    
    
    func update(allergy: String, Severity: String) {
        print(defaultArray.count)
        var update = Allergies(name: allergy, reaction: "Severe", severity: Severity)
        defaultArray.append(update)
        print(defaultArray.count)
    }
    
    
    
    
}
    

