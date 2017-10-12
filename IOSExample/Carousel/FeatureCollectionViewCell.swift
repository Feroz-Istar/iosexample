//
//  FeatureCollectionViewCell.swift
//  IOSExample
//
//  Created by Istar Feroz on 11/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class FeatureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var mylabel: UIButton!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 10,height: 10)
        self.clipsToBounds = true
    }
}
