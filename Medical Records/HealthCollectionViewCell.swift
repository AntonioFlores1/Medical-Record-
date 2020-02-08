//
//  HealthCollectionViewCell.swift
//  Medical Records
//
//  Created by antonio  on 2/7/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit

class HealthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var healthIcon: UIImageView!
    
    @IBOutlet weak var healthLabel: UILabel!
    
    

//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//
//    private func commonInit() {
//        setUpIconConstraints()
//        setuplabelConstraints()
//    }
//
//
//    private func setUpIconConstraints() {
//        //addSubview(healthIcon)
//
//        healthIcon.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            healthIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//            healthIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
//            healthIcon.heightAnchor.constraint(equalTo: healthIcon.widthAnchor),
//            healthIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
//
//    private func setuplabelConstraints() {
//
//        // addSubview(healthLabel)
//
//        healthLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            healthLabel.topAnchor.constraint(equalTo: healthIcon.bottomAnchor, constant: 10),
//            healthLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            healthLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
//
//    }
//
}
