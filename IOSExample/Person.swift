//
//  Person.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
struct Person: Codable {
    let name: String
    let age: Int
    
    func getString() -> String {
        return "Name: \(name), Age: \(age)"
    }
}
