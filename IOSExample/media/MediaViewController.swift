//
//  MediaViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 05/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import AVKit

import AVFoundation

class MediaViewController: UIViewController {
 
    
    var bombSoundEffect: AVAudioPlayer?
    var currentTime:Double?
    var videoPlayer:AVPlayer?
    @IBOutlet weak var myimage: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        SaveMedia().saveMedia(url: url!, directory: "chameli/sex")
        
        
        
        
        
        // fetch image from local
        FileChecker().loadImage(filename: "chumpy.png", directory: "chameli/sex", myimage: myimage)
//        let imagepath = FileChecker().getPath(filename: "chumpy.png", directory: "chameli/sex")
//        let u = URL(fileURLWithPath: imagepath)
//        do {
//
//            myimage.image = UIImage(contentsOfFile: imagepath)
//        } catch {
//            print("Error loading image : \(error)")
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

    @IBAction func playClicked(_ sender: UIButton) {
        //play audio from local
        let path = FileChecker().getPath(filename: "tailtoddle_lo4.mp3", directory: "chameli/sex")
        let urls = URL(fileURLWithPath: path)
        do{
            bombSoundEffect = try AVAudioPlayer(contentsOf: urls)
            bombSoundEffect?.play()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    @IBAction func pauseClicked(_ sender: UIButton) {
        bombSoundEffect?.pause()
        currentTime = bombSoundEffect?.currentTime
    }
    @IBAction func resumeClicked(_ sender: UIButton) {
        bombSoundEffect?.currentTime = currentTime!
        bombSoundEffect?.play()

    }
    
    @IBAction func changeImage(_ sender: UIButton) {
//        let myurl = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
//        let player = AVPlayer(url: myurl! as URL)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
        
        let playerViewController = PlayMediaUrl().playVideo(url: "http://techslides.com/demos/sample-videos/small.mp4")
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        //FileChecker().loadImage(filename: "john.jpg", directory: "chameli/sex", myimage: myimage)
        
    }
}
