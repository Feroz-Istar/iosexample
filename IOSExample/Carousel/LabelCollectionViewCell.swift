//
//  LabelCollectionViewCell.swift
//  IOSExample
//
//  Created by Istar Feroz on 12/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func layoutSubviews() {
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 10,height: 10)
        self.clipsToBounds = true
    }
}
