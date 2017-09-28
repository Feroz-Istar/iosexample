//
//  JsonViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cc = HttpCall(url: "http://localhost:8080/TestRest/TestRest")
        print(cc.getResponse())
        let data = cc.getResponse().data(using: String.Encoding.utf8, allowLossyConversion: false)!
        do {
            var json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            var jsonData: Data?
            if  json != nil {
                jsonData = try? JSONSerialization.data(withJSONObject: json)
            }
            var decodedPerson: Feroz?
            if let data = jsonData {
                decodedPerson = try? JSONDecoder().decode(Feroz.self, from: data)
            }
            print(decodedPerson?.name)
            print(decodedPerson?.tasks?.count)
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
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

}
