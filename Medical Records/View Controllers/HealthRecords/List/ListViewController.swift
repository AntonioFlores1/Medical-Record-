//
//  ListViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var index: Int?
    
    let healthBoxes = ["Allergies","Past Procedures","Medication","Conditions","Immunization","Lab Results"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        listTableView.dataSource = self
        listTableView.delegate = self

    }
   
    
    
    func setupNav() {
        guard let index = index else {
            return
        }
       // print(healthBoxes[index])
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "My \(healthBoxes[index])"
        
        //let barButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        //barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -5), for: .default)
        
     
    }
    
    
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        
    }
   
        

    }

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let index = index else {
            return 10
        }
        switch index {
        case 0:
            return patientAllergies.count
        case 1:
            return patientProcedures.count
        case 2:
            return patientMedication.count
        case 3:
            return patientConditions.count
        case 4:
            return patientImmunization.count
        case 5:
            break
        default:
            print("issue here")
            
        }
    
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "list") as? ListTableViewCell, let index = index else {
            fatalError("table view cell or index issue issue")
        }
        
        
        switch index {
        case 0:
            let item = patientAllergies[indexPath.row]
            cell.configureAllergies(allergy: item)
        case 1:
           let item = patientProcedures[indexPath.row]
           cell.configProcedures(procedure: item)
        case 2:
            let item = patientMedication[indexPath.row]
            cell.configureMeds(med: item)
        case 3:
            let item = patientConditions[indexPath.row]
            cell.configCondition(condition: item)
        case 4:
            let item = patientImmunization[indexPath.row]
            cell.configImmunization(vaccine: item)
        case 5:
            break
        default:
            print("issue here")

        }

        return cell
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
        
    

// create a func that takes in a cell and configures it based on the index passed configure it with the patient data as well will set the nav bar to what was segued from





