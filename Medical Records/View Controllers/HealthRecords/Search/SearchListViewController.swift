//
//  SearchListViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

protocol updateHealthDelegate:AnyObject {
    func update(allergy:String,Severity:String)
}

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var searchListTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var create: UIView!
    
    @IBOutlet weak var allergyTextField: UITextField!
    
    @IBOutlet weak var severityTextField: UITextField!
    
    
    var dummy: String?
  
    var defaultArray = [Allergy(name: "Milk", reaction: "rank_last_week", severity: "Severe"),
                    Allergy(name: "Paper", reaction: "rank_last_week", severity: "Mild"),
                    Allergy(name: "rank", reaction: "rank_last_week", severity: "Severe"),
                    Allergy(name: "Bees", reaction: "rank_last_week", severity: "Moderate"),
                    Allergy(name: "Pan", reaction: "rank_last_week", severity: "Mild"),
                    Allergy(name: "Sink", reaction: "rank_last_week", severity: "Moderate")]

//    var defaultArray = ["rank","rank_last_week","weeks_on_list","asterisk","dagger","primary_isbn10", "0735211299","primary_isbn13","9780735211292","publisher","Avery","description","price","title","ATOMIC HABITS","author","James Clear","contributor","by James Clear","contributor_note","book_image","book_image_width"]

    
    
    var dummyData = [Allergy]() {
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
        self.create.transform = CGAffineTransform.init(translationX: 0, y: 800)
        
    }
   
    
    
    @IBAction func createButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.create.transform = CGAffineTransform.init(translationX: 0, y: 0)
        })

    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        self.create.transform = CGAffineTransform.init(translationX: 0, y: 800)
    

        showAlert(message: "Information has been saved")
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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
