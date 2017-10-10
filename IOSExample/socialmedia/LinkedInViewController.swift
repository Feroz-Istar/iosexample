//
//  LinkedInViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 09/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import LinkedinSwift

class LinkedInViewController: UIViewController {
    private let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "81ud02z2165f3l", clientSecret: "L00HFUXqDYbjqDHF", state: "DLKDJF46ikMMZADfdfds", permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "https://com.appcoda.linkedin.oauth/oauth"))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        linkedinHelper.authorizeSuccess({ (token) in
            
            print(token)
            self.fetchProfile()
            //This token is useful for fetching profile info from LinkedIn server
        }, error: { (error) in
            
            print(error.localizedDescription)
            //show respective error
        }) {
            //show sign in cancelled event
        }
     
     
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
    func fetchProfile(){
        
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address,picture-url,picture-urls::(original),positions,date-of-birth,phone-numbers,location)?format=json", requestType: LinkedinSwiftRequestGet, success: { (response) -> Void in
            
            print(response)
            //parse this response which is in the JSON format
        }) {(error) -> Void in
            
            print(error.localizedDescription)
            //handle the error
        }
    }

}
