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
        healthCollectionView.delegate = self
        // make nav title big
        navigationItem.title = "Health Records"
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
        
        collectionCell.healthIcon.image = UIImage(named: healthBoxes[indexPath.row])
        collectionCell.healthLabel.textColor = .black
        collectionCell.healthLabel.text = titles
        collectionCell.backgroundColor = .systemBackground
        
        return collectionCell
    }
}

extension HealthRecordViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // expecting a cg size which is a tuple of two values
        
        let interItemSpacing: CGFloat = 10 // space betweem items
        let maxWidth = UIScreen.main.bounds.size.width // device width
        
        let numberOfItems: CGFloat = 2 // items
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        
        let itemWidth: CGFloat = (maxWidth - totalSpacing)/numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth * 1.15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // padding sround collectionview
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
}

