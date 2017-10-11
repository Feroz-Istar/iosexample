//
//  ThreadViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 10/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ThreadViewController: UIViewController {
    let defaults:UserDefaults = UserDefaults.standard
    var player: AVPlayer?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var mybutto: UIButton!
    
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //play video
        
        
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = videoView.frame
        self.addChildViewController(playerViewController)
        self.view.addSubview(playerViewController.view)

        
        
        
        
        
        play(url: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")!)
        if let opened:Data = self.defaults.data(forKey: "studentProfile" ){
            do{
            var cc: StudentProfile?
            cc = try JSONDecoder().decode(StudentProfile.self, from: opened)
                print("cc -----------> \(String(describing: cc?.firstName!))")
               // FileChecker().loadImageFromUrl(url: (cc?.profileImage!)!, myimage: profileImage)
                let gifURL : String = "http://www.gifbin.com/bin/4802swswsw04.gif"
                
                let imageURL = UIImage.gifImageWithURL(gifUrl: gifURL)
                profileImage.image = imageURL
                
            }catch {
                
            }
        }
//        DispatchQueue.global(qos: .userInitiated).async {
//            // Download file or perform expensive task
//            let success = self.getResponse(url: "http://business.talentify.in/t2c/user/449/complex")
//           let bb = self.convertToDictionary(text: success)
//           print(bb?["id"])
//            DispatchQueue.main.async {
//                self.mybutto.setTitle(("\(bb!["id"]!)"), for: .normal)
//            }
//        }
        
        let concurrentQueue = DispatchQueue(label: "lolwa", attributes: .concurrent)
        concurrentQueue.async {
            let success = self.getResponse(url: "http://business.talentify.in/t2c/user/449/complex")
           let bb = self.convertToDictionary(text: success)
          
            
           
            do {
              
                let json = try JSONSerialization.jsonObject(with: success.data(using: .utf8)!, options: []) as! [String: AnyObject]
                var jsonData: Data?
                jsonData = try JSONSerialization.data(withJSONObject: json["studentProfile"]! as! [String: AnyObject])
                print(String(data: jsonData!, encoding: String.Encoding.utf8) ?? "Data could not be printed")

                var decodedPerson: StudentProfile?
                if let data = jsonData {
                    decodedPerson = try JSONDecoder().decode(StudentProfile.self, from: data)
                    self.defaults.set(data, forKey: "studentProfile")

                }

                print(decodedPerson?.mobile! ?? "")
                }
            catch let error as NSError {
                print("Failed to load: \(error)")
            }

            
            
        }

        
        
//        let serial = DispatchQueue(label: "lolwaserial", attributes: .concurrent)
//        serial.sync {
//            self.getResponse(url: "http://business.talentify.in/t2c/user/777/complex")
//            self.getResponse(url: "http://business.talentify.in/t2c/user/450/complex")
//        }
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

    
    func getResponse (url: String) -> String {
        let urlString = URL(string: url)
        
        let request = URLRequest(url:urlString!)
        var success = ""
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                print("Error while trying to re-authenticate the user: \(error)")
            } else if let response = response as? HTTPURLResponse,
                300..<600 ~= response.statusCode {
                print("Error while trying to re-authenticate the user, statusCode: \(response.statusCode)")
            } else {
                success = String(data: data!, encoding: .utf8)!
               // print(success   )
            }
            
            semaphore.signal()
        })
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return success
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func play(url:URL) {
        print("playing \(url)")
        
        do {
            
            let playerItem = AVPlayerItem(url: url)
            
            self.player = try AVPlayer(playerItem:playerItem)
            player!.volume = 1.0
            player!.play()
        } catch let error as NSError {
            self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
}
