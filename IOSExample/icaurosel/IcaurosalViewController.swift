//
//  IcaurosalViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 12/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class IcaurosalViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {

    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var dssss: UIView!
    
 
    
    @IBOutlet weak var mylabel: UILabel!
    
    
    @IBOutlet weak var myview: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let carousel = iCarousel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        carousel.dataSource = self
        carousel.type = .coverFlow
        view.addSubview(carousel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        if view != nil {
            return view!
        } else {
            dssss = view
        }
        
       
        return dssss
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
