//
//  ViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl"]
    var someDict = ["TimerStoryboard":"timer"]
    var story = Stories(storyboardName: "TimerStoryboard", storyboardNameIdentifier: "TimerStoryboard")
    var storyArr = [Stories]()
    override func viewDidLoad() {
        super.viewDidLoad()
        storyArr = [story]

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            // Return the number of rows in the section.
            return someDict.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cellIdentifier = "cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                     for: indexPath) as! MyTabelCellTableViewCell
            // Configure the cell...
            
            let keys = Array(someDict.keys)[indexPath.row]
            let keyvalue = Array(someDict)[indexPath.row].value

            cell.mylabel?.text = keys
            cell.mybutton.setTitle(keyvalue, for: .normal)
          
            cell.mybutton.tag = indexPath.row;

            cell.mybutton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)

            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(someDict[indexPath.row])
        print(Array(someDict.keys)[indexPath.row])
        let ss = storyArr[indexPath.row]
        print(ss.storyboardName)
    }
    
    @objc private func buttonClicked(sender:UIButton) {
        print("button is clikced \(sender.tag)")
        let keys = Array(someDict.keys)[sender.tag]
        let keyvalue = Array(someDict)[sender.tag].value
        changStoryBoard(name: keys, identifier: keyvalue)
       // print(someDict[sender.tag])
        // your code goes here
        //print(Array(wordByLanguage.keys)[1])
        //print(Array(wordByLanguage)[1].value)
    }
    
    func changStoryBoard(name : String, identifier : String)-> Void {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier) as UIViewController
        present(vc, animated: true, completion: nil)
    }

}

