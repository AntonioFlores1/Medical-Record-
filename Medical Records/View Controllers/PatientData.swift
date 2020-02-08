//
//  PatientData.swift
//  Medical Records
//
//  Created by Amy Alsaydi on 2/8/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import Foundation


var patientAllergies = [Allergy(name: "Peanuts", reaction: "Hives, Reddness and Swelling", severity: "Severe"),
Allergy(name: "Penicillin", reaction: "Runny nose and Shortness of breath", severity: "Mild")]

var patientMedication = [Medications(name: "Metformin", description: "Anti-diabetic medication", usage: "2 Tablets, twice daily"), Medications(name: "Amlodipine", description: "Treats high blood pressure", usage: "1 Tablet, once a day") ]

var patientProcedures = [Procedure(name: "Cataract Surgery", date: "01/02/2007"), Procedure(name: "Appendectomy", date: "11/12/2000")]

var patientConditions = [Condition(name: "Diabetes", dateOfDiagnosis: "02/23/2001"), Condition(name: "Hypertension", dateOfDiagnosis: "09/08/2005")]

var patientImmunization = [Immunization(name: "Flu shot", date: "10/23/2018")]

// var patientLabs = []
