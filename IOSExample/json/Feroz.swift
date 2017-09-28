//
//  Feroz.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class Feroz: Codable {
    var name: String?
    var age: Int?
    var tasks: Array<Task>?
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let name = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }else{
            self.name = nil
        }
        if let age = try container.decodeIfPresent(String.self, forKey: .age) {
            self.age = Int(age)!
        }else{
        self.age = nil
        }
        
        
        if let tasks = try container.decodeIfPresent(Array<Task>.self, forKey: .tasks) {
            self.tasks = tasks
        }else{
            self.tasks = nil
        }
}


}
