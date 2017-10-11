//
//  UnzipViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import SSZipArchive

class UnzipViewController: UIViewController {
    
    @IBAction func unzip(_ sender: Any) {
        

//        SaveMedia().unzipFile(url: URL(string: "http://cdn.talentify.in:9999//lessonXMLs/10105.zip")!, directory: "chameli/sex")

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FileChecker().getPath(filename: URL(string: "http://cdn.talentify.in:9999//lessonXMLs/10105.zip")!.lastPathComponent, directory: "chameli/sex")
        //let request = URLRequest(url: URL(string: "http://192.168.1.9:8080/TestRest/TestRest")!)
        SaveMedia().saveZipFile(url: URL(string: "http://cdn.talentify.in:9999//lessonXMLs/10105.zip")!, directory: "chameli/sex");
        SaveMedia().unzipFile(url: URL(string: "http://cdn.talentify.in:9999//lessonXMLs/10105.zip")!, directory: "chameli/sex")
        
        
        
        
        
//        let task = URLSession.shared.dataTask(with: request, completionHandler: { tempLocalUrl, response, error in
//            if let error = error {
//                print("Error while trying to re-authenticate the user: \(error)")
//            } else if let response = response as? HTTPURLResponse,
//                300..<600 ~= response.statusCode {
//                print("Error while trying to re-authenticate the user, statusCode: \(response.statusCode)")
//            } else {
//                print(response)
//                do {
//                    try FileManager.default.copyItem(at: tempLocalUrl as URL, to: FileChecker().getPathURL(filename: "10105.zip", directory: "chameli/sex"))
//
//
//
//                } catch (let writeError) {
//                    print("Error creating a file : \(writeError)")
//                }
//
//            }
//
//        })
        
        
//        let task = URLSession.shared.downloadTask(with: request) { (tempLocalUrl, response, error) in
//            if let tempLocalUrl = tempLocalUrl, error == nil {
//                // Success
//                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
//                    print("Successfully downloaded. Status code: \(statusCode)")
//                }
//
//                do {
//                    try FileManager.default.copyItem(at: tempLocalUrl as URL, to: FileChecker().getPathURL(filename: "10105.zip", directory: "chameli/sex"))                } catch (let writeError) {
//                        print("Error creating a file  : \(writeError)")
//                }
//
//            } else {
//                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
//            }
//        }
//        task.resume()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
