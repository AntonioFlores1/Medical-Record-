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
        healthCollectionView.backgroundColor = .systemBackground

        healthCollectionView.dataSource = self
        healthCollectionView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Health Records"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let listVC = segue.destination as? ListViewController, let indexpath = healthCollectionView.indexPathsForSelectedItems else {
            fatalError("no list VC")
        }
        
        let index = indexpath[0].row
        
        listVC.index = index
        
    }

}

extension HealthRecordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthBoxes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = healthCollectionView.dequeueReusableCell(withReuseIdentifier: "health", for: indexPath) as? HealthCollectionViewCell else {
            fatalError("issue here")
        }
        
        let titles = healthBoxes[indexPath.row]
        
        collectionCell.healthIcon.image = UIImage(named: healthBoxes[indexPath.row])
        collectionCell.healthLabel.textColor = .black
        collectionCell.healthLabel.text = titles
        collectionCell.backgroundColor = .systemBackground
        collectionCell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionCell.layer.cornerRadius = 10
        collectionCell.layer.borderWidth = 1
        collectionCell.contentView.layer.masksToBounds = true
        collectionCell.layer.shadowColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) 
        collectionCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        collectionCell.layer.shadowRadius = 2.0
        collectionCell.layer.shadowOpacity = 1.0
        collectionCell.layer.masksToBounds = false
        collectionCell.layer.shadowPath = UIBezierPath(roundedRect: collectionCell.bounds,cornerRadius:collectionCell.contentView.layer.cornerRadius).cgPath
        
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
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // padding sround collectionview
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
}

