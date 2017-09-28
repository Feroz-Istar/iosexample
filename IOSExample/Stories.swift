//
//  Stories.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation

class Stories {
    var storyboardName: String
    var storyboardNameIdentifier: String
    
    init(storyboardName: String,storyboardNameIdentifier: String) { // Constructor
        self.storyboardName = storyboardName
        self.storyboardNameIdentifier = storyboardNameIdentifier                // An error if a declared property isn't initialized
    }
}
