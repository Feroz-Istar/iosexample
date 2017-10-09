//
//  PlayMediaUrl.swift
//  IOSExample
//
//  Created by Istar Feroz on 07/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

class PlayMediaUrl {
    
    func playVideo(url: String) -> AVPlayerViewController {
        
        let myurl = URL(string: url)
        let player = AVPlayer(url: myurl! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
       
        return playerViewController
        
    }
    
    
}
