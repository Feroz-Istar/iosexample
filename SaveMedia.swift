//
//  SaveMedia.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class SaveMedia {
    
    func saveMedia(url:URL) -> Void{
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(url.lastPathComponent)
        print(destinationUrl)
        URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                print("File moved to documents folder \(location)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }).resume()
    }
    
    func saveMedia(url:URL,directory: String) -> Void{
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let directoryUrl = documentsDirectoryURL.appendingPathComponent(directory)
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(directory+"/"+url.lastPathComponent)
        print(destinationUrl)
        
        if !FileManager.default.fileExists(atPath: directoryUrl.path) {
            do {
                try  FileManager.default.createDirectory(atPath: directoryUrl.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Couldn't create document directory")
            }
        }
        
        
        
        URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                print("File moved to documents folder \(location)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }).resume()
    }
    
    
}
