//
//  CardView.swift
//  IOSExample
//
//  Created by Istar Feroz on 12/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 5
    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor
    @IBInspectable var shadowOpacity: CGFloat = 0.5

    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.shadowColor = self.shadowColor
        //layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius)
        
        layer.shadowOpacity = Float(self.shadowOpacity)
        
        
    }


    
}
