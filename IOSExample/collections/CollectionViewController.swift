//
//  CollectionViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 29/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    
    

    @IBOutlet weak var collectionview: UICollectionView!
    
    var nos_images = ["One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nos_images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellIdentifier = "CellIdentifier"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                 for: indexPath) as! CollectionViewCell
        cell.myimage.image = UIImage(named: nos_images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
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
