//
//  SaveMedia.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
import SSZipArchive

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
        
        
        if FileManager.default.fileExists(atPath: destinationUrl.path) {
            print("The file already exists at path")
            do{
            try FileManager.default.removeItem(at: destinationUrl)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
                // if the file doesn't exist
        } else {
            
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
    
    
    func saveZipFile(url: URL, directory: String) -> Bool {
        let request = URLRequest(url: url)
        let semaphore = DispatchSemaphore(value: 0)

        var success = false

        
        let task = URLSession.shared.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }

                do {
                   try FileManager.default.copyItem(at: tempLocalUrl as URL, to: FileChecker().getPathURL(filename: url.lastPathComponent, directory: directory))
                    success = true
                    print("sucessfully downloaded the zip file ...........")
                    semaphore.signal()


                } catch (let writeError) {
                        print("Error creating a file  : \(writeError)")
                }


            } else {
                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
            }
        }
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return success
    }
    
    
    
    
    func unzipFile(url:URL,directory: String) -> Void {
        let path = FileChecker().getPath(filename: url.lastPathComponent, directory: directory)
        
        let lpath = FileChecker().getPath(filename: "", directory: directory)
        SSZipArchive.unzipFile(atPath: path, toDestination: lpath)

    }
    
}
