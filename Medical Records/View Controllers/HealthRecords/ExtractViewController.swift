//
//  ExtractViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/8/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class ExtractViewController: UIViewController {

    @IBOutlet weak var extractTextView: UITextView!
    
    var dataExtract: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractTextView.text = dataExtract
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
