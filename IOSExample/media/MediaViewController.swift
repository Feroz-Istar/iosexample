//
//  MediaViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 05/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import AVFoundation

class MediaViewController: UIViewController {
 
    
    var bombSoundEffect: AVAudioPlayer?

    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3")
        SaveMedia().saveMedia(url: url!, directory: "chameli/sex")
//        let path = Bundle.main.path(forResource: "ddd.mp3", ofType:nil)!
//        let url = URL(fileURLWithPath: path)
//        //let urlstring = "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3"
//        //let url = URL(string: urlstring)
//
//        do {
//
//            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
//            bombSoundEffect?.prepareToPlay()
//           bombSoundEffect?.play()
//
//
//        } catch let error as NSError {
//            // couldn't load file :(
//            print(error.localizedDescription)
//        }
        print(FileChecker().checkFile(name: "viksit/feroz/feroz1.mp3" ))
        print(listFilesFromDocumentsFolder())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func listFilesFromDocumentsFolder() -> [String]?
    {
        let fileMngr = FileManager.default;
        
        // Full path to documents directory
        let docs = fileMngr.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        
        // List all contents of directory and return as [String] OR nil if failed
        return try? fileMngr.contentsOfDirectory(atPath:docs)
    }
    
    
    func createDirectory(){
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent("viksit").appendingPathComponent("feroz")
            if !fileManager.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    NSLog("Couldn't create document directory")
                }
            }
            NSLog("Document directory is \(filePath)")
        }
    }

}
