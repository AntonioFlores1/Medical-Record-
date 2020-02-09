//
//  ProfileViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/8/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    var effect: UIVisualEffect?
    
    // feild outlets
    
    @IBOutlet weak var insuranceFeild: UILabel!
    @IBOutlet weak var addressFeild: UILabel!
    @IBOutlet weak var heightFeild: UILabel!
    @IBOutlet weak var weightFeild: UILabel!
    @IBOutlet weak var emFeild: UILabel!
    
    @IBOutlet weak var toggle: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         effect = blur.effect
        blur.effect = nil 
        toggle.isOn = false
        
        loadData()
        
        profileView.layer.shadowColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        profileView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        profileView.layer.shadowRadius = 4.0
        profileView.layer.shadowOpacity = 1.0
        profileView.layer.masksToBounds = false
        
        
        
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
        profileView.layer.borderColor = UIColor.red.cgColor
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.borderWidth = 0
        
        profileView.layer.borderColor = UIColor.black.cgColor
        profileView.layer.cornerRadius = 22
        //profileTableView.dataSource = self
    }
    
    
    func loadData() {
        insuranceFeild.text = "Aetna"
        addressFeild.text = "111 One Street Brooklyn NY 11121"
        heightFeild.text = "5'4"
        weightFeild.text = "130 lb"
        emFeild.text = "Weil Cornel (123) 222-444"
    }
    
    @IBAction func blurToggled(_ sender: UISwitch) {
        
        blur.effect = nil
        
        if sender.isOn {
            blur.effect = effect
        } else {
            blur.effect = nil
        }
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile")
            return cell!
        } else if indexPath.row == 1 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile1")
             return cell!
        } else if indexPath.row == 2 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile2")
             return cell!
        } else if indexPath.row == 3 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile3")
             return cell!
        } else if indexPath.row == 4 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile4")
             return cell!
        } else {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profile1")
                        return cell!
        } 
    }
    
    
    
}
