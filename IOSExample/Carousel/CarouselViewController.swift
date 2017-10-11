//
//  CarouselViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 11/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var nos_images = ["One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four","One","Two","Three","Four"]

    let cellscaling: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screensize = UIScreen.main.bounds.size
        let cellwidth = floor(screensize.width * cellscaling)
        let cellheight = floor(screensize.height * cellscaling)
        let insetX = (view.bounds.width - cellwidth) / 2.0
        let insetY = (view.bounds.height - cellwidth) / 2.0
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellwidth, height: cellheight)
        collectionView.contentInset = UIEdgeInsetsMake(insetY, insetX, insetY, insetX)
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
        
        let cellIdentifier = "caurosalcell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! CaurosalCollectionViewCell
        cell.featureImage.image = UIImage(named: nos_images[indexPath.row])
        cell.title.text = nos_images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundIndex = round(index)
        offset = CGPoint(x: roundIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
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
