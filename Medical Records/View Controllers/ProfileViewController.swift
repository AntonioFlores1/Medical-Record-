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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
        profileView.layer.borderColor = UIColor.red.cgColor
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.borderWidth = 0
        
        profileView.layer.borderColor = UIColor.black.cgColor
        profileView.layer.cornerRadius = 22
        profileTableView.dataSource = self
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
        

        
//        return cell
    }
}
