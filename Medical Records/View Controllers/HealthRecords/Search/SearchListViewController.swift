//
//  SearchListViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var searchListTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchListTableView.dataSource = self
        searchBar.delegate = self
    }
    

    

}

extension SearchListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchListTableView.dequeueReusableCell(withIdentifier: "search", for: indexPath)
        
        cell.detailTextLabel!.text = "Hello"
        cell.textLabel!.text = "Thing"
        
        return cell
        
    }
    
    
}

extension SearchListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
