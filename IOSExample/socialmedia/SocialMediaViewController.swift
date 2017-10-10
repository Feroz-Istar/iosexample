//
//  SocialMediaViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 09/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import GoogleSignIn
class SocialMediaViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {
    
    @IBOutlet weak var name: UILabel!
    
    let defaults:UserDefaults = UserDefaults.standard
    
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var gsignin: GIDSignInButton!
    
    @IBOutlet weak var logout: UIButton!
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        self.checkLogin()
        name.text = user.profile.name
        email.text = user.profile.email
        defaults.set(name.text, forKey: "name")
        defaults.set(email.text, forKey: "email")

        print(user.profile.email)
        let accessToken = GIDSignIn.sharedInstance().currentUser.authentication.accessToken

        print("accessToken accessToken  \(accessToken)")

        let url = URL(string:  "https://www.googleapis.com/oauth2/v3/userinfo?access_token=\(accessToken!)")
        print("sjkhjs jskh  \(url)")
        var request = URLRequest(url:url!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            do {
                let userData = try JSONSerialization.jsonObject(with: data!, options:[]) as? [String:AnyObject]
                let picture = userData!["picture"] as! String
                let gender = userData!["gender"] as! String
                let locale = userData!["locale"] as! String
                
                self.defaults.set(picture, forKey: "picture")

                print("pic \(picture)")
                print("gender \(gender)")
                print("locale \(locale)")

            } catch {
                NSLog("Account Information could not be loaded")
            }
            
        }).resume()
        
        
    }
    

    @IBOutlet weak var googleSIgnIn: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self

        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "246126733676-8isf95i48ij3rr41q3pd7v3d7stohofe.apps.googleusercontent.com"

        checkLogin()
       
        // Do any additional    setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
   
    
  
    @IBAction func logoutClicked(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()

    }
    
    func checkLogin(){
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            /* Code to show your tab bar controller */
            print("already sign in ")
            logout.isHidden = false
        } else {
            print("sig out ")
            logout.isHidden = true

            /* code to show your login VC */
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    

}
