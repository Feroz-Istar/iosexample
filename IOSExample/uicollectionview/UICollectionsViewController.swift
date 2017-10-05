//
//  UICollectionsViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 05/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class UICollectionsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var cellWidthScaling:CGFloat = 3.0
    var cellHeightScaling:CGFloat = 3.0
    @IBOutlet weak var collectionView: UICollectionView!
    
    
var nos_images = ["One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setCollectionCellSize()
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
        
        let cellIdentifier = "collections"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! ImageCollectionViewCell
        cell.myimage.image = UIImage(named: nos_images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func setCollectionCellSize(){
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width / 1)
        //let cellHeight = floor(screenSize.height / 1)
        
        //let insetX = (view.bounds.width - cellWidth)/2.0
        //let insetY = (view.bounds.height - cellHeight)/2.0
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cellWidth/3, height: 100)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = layout
        
        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width / 1)
        
        return CGSize(width: cellWidth/3, height: cellWidth / 3)
    }
   
   
    //UICollectionViewDelegateFlowLayout methods
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
