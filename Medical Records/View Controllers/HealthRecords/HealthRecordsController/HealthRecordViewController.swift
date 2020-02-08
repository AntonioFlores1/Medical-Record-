//
//  HealthRecordViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class HealthRecordViewController: UIViewController {

    
    @IBOutlet weak var healthCollectionView: UICollectionView!
    
    let healthBoxes = ["Allergies","Past Procedures","Medication","Conditions","Immunization","Lab Results"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        healthCollectionView.dataSource = self
        
    }
    

    
    

}

extension HealthRecordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthBoxes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = healthCollectionView.dequeueReusableCell(withReuseIdentifier: "health", for: indexPath) as? HealthCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let titles = healthBoxes[indexPath.row]
        
        collectionCell.healthIcon.image = UIImage(systemName: "plus")
        collectionCell.healthLabel.text = titles
        
        return collectionCell
    }
    
    
    
}

