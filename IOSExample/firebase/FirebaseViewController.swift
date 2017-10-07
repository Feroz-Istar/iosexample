//
//  FirebaseViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 29/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import Firebase

class FirebaseViewController: UIViewController {
    let someDictionary=["Feroz" : "siddiqui"]
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
        
        
        //ref.child("istar-notification-ios").child("Feroz").setValue(someDictionary)
        ref.child("istar-notification-ios").child("Feroz").observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            for (key, value) in postDict {
                print("my key -> \(key as String)")
                if key  is Dictionary<AnyHashable,Any> {
                    print("Yes, it's a Dictionary")
                    let myref = value as! NSDictionary
                    
                    for(key1, value1) in myref {
                        print("child key -> \(key1 as! String) child values -> \(value1 as Any)")
                    }
                }else{
                    print("No , it's not a Dictionary")
                }
            }
            print("dddd \(postDict)")
            
        })
        
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
