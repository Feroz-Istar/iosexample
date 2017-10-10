//
//  FacebookViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 09/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit
import FirebaseCore

import FacebookCore
import FacebookLogin

class FacebookViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginManager().logOut()
//        view.addSubview(loginButton)
//        loginButton.center = view.center
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.center = view.center;
        myLoginButton.setTitle("ss ss s s", for: .normal)
       myLoginButton.frame =  CGRect(x: 100, y: 100, width: 100, height: 50)
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            print("user is logged in ")
        }else {
            print("user is not logged in ")

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
   
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ReadPermission.publicProfile, ReadPermission.email, ReadPermission.userFriends], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(grantedPermissions: let permission, declinedPermissions: let declined, token: let accessToken):
                self.getGraph()
            }
        }
    }
    
    
    func getGraph(){
        print("getGraph Logged in!")

        let connection = GraphRequestConnection()
        connection.add(MyProfileRequest()) { httpResponse, result in
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response.profilePictureUrl! )")
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    /*
    // MARK: - Navigation
     
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    struct MyProfileRequest: GraphRequestProtocol {
        struct Response: GraphResponseProtocol {
            var name: String?
            var id: String?
            var gender: String?
            var email: String?
            var profilePictureUrl: String?
            
            init(rawResponse: Any?) {
                // Decode JSON from rawResponse into other properties here.
                guard let response = rawResponse as? Dictionary<String, Any> else {
                    return
                }
                
                if let name = response["name"] as? String {
                    self.name = name
                }
                
                if let id = response["id"] as? String {
                    self.id = id
                }
                
                if let gender = response["gender"] as? String {
                    self.gender = gender
                }
                
                if let email = response["email"] as? String {
                    self.email = email
                }
                
                if let picture = response["picture"] as? Dictionary<String, Any> {
                    
                    if let data = picture["data"] as? Dictionary<String, Any> {
                        if let url = data["url"] as? String {
                            self.profilePictureUrl = url
                        }
                    }
                }
            }
        }
        
        var graphPath = "/me"
        var parameters: [String : Any]? = ["fields":"email,first_name,last_name,picture.width(1000).height(1000),birthday,gender"]
        var accessToken = AccessToken.current
        var httpMethod: GraphRequestHTTPMethod = .GET
        var apiVersion: GraphAPIVersion = .defaultVersion
    }
}

