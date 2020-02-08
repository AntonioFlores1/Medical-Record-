//
//  SearchListViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

protocol updateHealth:AnyObject {
    func update()
}


class SearchListViewController: UIViewController {
    
    @IBOutlet weak var searchListTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    
    var dummy: String?
    var defaultArray = [Allergies(name: "Milk", reaction: "rank_last_week", severity: "Severe"),
                    Allergies(name: "Paper", reaction: "rank_last_week", severity: "Mild"),
                    Allergies(name: "rank", reaction: "rank_last_week", severity: "Severe"),
                    Allergies(name: "Bees", reaction: "rank_last_week", severity: "Moderate"),
                    Allergies(name: "Pan", reaction: "rank_last_week", severity: "Mild"),
                    Allergies(name: "Sink", reaction: "rank_last_week", severity: "Moderate")]
//
//    var defaultArray = ["rank","rank_last_week","weeks_on_list","asterisk","dagger","primary_isbn10", "0735211299","primary_isbn13","9780735211292","publisher","Avery","description","price","title","ATOMIC HABITS","author","James Clear","contributor","by James Clear","contributor_note","book_image","book_image_width"]
    
    
    var dummyData = [Allergies]() {
        didSet {
            searchListTableView.reloadData()
        }
    }
    
    var searchQueary = "" {
        didSet {
            dummyData = dummyData.filter({$0.name.lowercased().contains(searchQueary.lowercased())})
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dummyData = defaultArray
        searchListTableView.dataSource = self
        searchListTableView.delegate = self
        searchBar.delegate = self
        
    }
    
    @IBAction func createButton(_ sender: UIButton) {
        
        
        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    
    
}

extension SearchListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchListTableView.dequeueReusableCell(withIdentifier: "search", for: indexPath)
        
        let dummy = dummyData[indexPath.row]
        
        if dummy.severity == "Moderate" {
            cell.textLabel!.text = dummy.name
            cell.detailTextLabel?.text = dummy.severity
            cell.detailTextLabel?.textColor = .green
        } else if dummy.severity == "Severe" {
            cell.textLabel!.text = dummy.name
            cell.detailTextLabel?.text = dummy.severity
            cell.detailTextLabel?.textColor = .red
        } else if dummy.severity == "Mild" {
            cell.textLabel!.text = dummy.name
            cell.detailTextLabel?.text = dummy.severity
            cell.detailTextLabel?.textColor = .yellow
        }
        
        
        return cell
        
    }
    
    
}

extension SearchListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .lightText
        cell?.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
    }
}

extension SearchListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text!.isEmpty {
            dummyData = defaultArray
        } else {
            searchQueary = searchText
        }
    }
}
