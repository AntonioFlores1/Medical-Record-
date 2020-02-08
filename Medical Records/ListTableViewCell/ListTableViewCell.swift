//
//  ListTableViewCell.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detail1: UILabel!
    @IBOutlet weak var detail2: UILabel!
    
    
    func configureAllergies(allergy: Allergy) {
        nameLabel.text = allergy.name
        detail1.text = "Reaction: \(allergy.reaction)"
        detail2.text = "Severity: \(allergy.severity.uppercased())"
    }
    
    func configureMeds(med: Medications) {
        nameLabel.text = med.name
        detail1.text = med.description
        detail2.text = "USAGE: \(med.usage)"
        
    }
    
    func configProcedures(procedure: Procedure) {
        nameLabel.text = procedure.name
        detail1.text = "Date: \(procedure.date)"
        detail2.text = ""
    }
    
    func configCondition(condition: Condition) {
        nameLabel.text = condition.name
        detail1.text = "Date of Diagnosis: \(condition.dateOfDiagnosis)"
        detail2.text = ""
    }
    
    func configImmunization(vaccine: Immunization) {
        nameLabel.text = vaccine.name
        detail1.text = "Date: \(vaccine.date)"
        detail2.text = ""
        
    }
}
