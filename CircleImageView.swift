//
//  CircleImageView.swift
//  IOSExample
//
//  Created by Istar Feroz on 10/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class CircleImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCircleLayer()
    }
    
    private func setupCircleLayer() {
        layer.borderWidth = 1.0
       layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.size.height/2
        clipsToBounds = true
}
}
