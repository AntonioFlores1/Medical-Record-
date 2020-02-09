//
//  Model.swift
//  Medical Records
//
//  Created by Amy Alsaydi on 2/8/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import Foundation

struct Allergy {
    var name: String
    var reaction: String
    var severity: String
}


struct Medications {
    var name: String
    var description: String
    var usage: String
}

struct Procedure {
 var name: String
 var date: String

 }

struct Condition {
    var name: String
    var dateOfDiagnosis: String
}


struct Immunization {
    var name: String
    var date: String 
}


