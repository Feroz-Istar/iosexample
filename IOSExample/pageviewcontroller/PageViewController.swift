//
//  PageViewController.swift
//  IOSExample
//
//  Created by Istar Feroz on 05/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    

    var VCarr: [UIViewController] = []
    
    private func VCInstance(name: String) -> UIViewController{
        return UIStoryboard(name: "PageStoryboard",bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        VCarr = [VCInstance(name: "firstpage"),VCInstance(name: "secondpage")]
        if let VcFirst = VCarr.first {
            setViewControllers([VcFirst], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else{
            return VCarr.last
        }
        
        return VCarr[viewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < VCarr.count else{
            return VCarr.first
        }
        print(nextIndex)
        return VCarr[nextIndex]
    }
    
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCarr.count
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
