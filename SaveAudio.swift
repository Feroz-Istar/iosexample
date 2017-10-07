//
//  SaveAudio.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class SaveAudio{
    
    
    func saveAudioFile(url:URL) -> Void {
        
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(url.lastPathComponent)
        print(destinationUrl)
        if FileManager.default.fileExists(atPath: destinationUrl.path) {
            print("The file already exists at path")
            
            // if the file doesn't exist
        } else {
            
            // you can use NSURLSession.sharedSession to download the data asynchronously
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
    
}
