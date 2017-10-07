//
//  FileChecker.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class FileChecker {
    
    func checkFile(name:String) -> Bool{
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent(name)
            print("lok ---> \(fileManager.fileExists(atPath: filePath.path))")
            return fileManager.fileExists(atPath: filePath.path)
        }
        return false
    }
    
}
