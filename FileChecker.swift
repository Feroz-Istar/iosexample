//
//  FileChecker.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//
import UIKit

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
    
    func getPath(filename: String, directory:String) -> String{
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!        
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(directory+"/"+filename)
        print(destinationUrl)
        return destinationUrl.path
    }
    
    
    func getPathURL(filename: String, directory:String) -> URL{
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(directory+"/"+filename)
        print(destinationUrl)
        return destinationUrl
    }
    
    
    
    func loadImage(filename: String, directory:String, myimage: UIImageView) -> Void {
            let imagepath = self.getPath(filename: filename, directory: directory)
            myimage.image = UIImage(contentsOfFile: imagepath)
    }
    
}
