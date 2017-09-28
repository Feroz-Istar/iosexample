//
//  Task.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class Task: Codable {
    let name: String
    
    func getString() -> String {
        return "Name: \(name)"
    }
    
}
