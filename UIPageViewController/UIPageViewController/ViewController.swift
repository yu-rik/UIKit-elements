//
//  ViewController.swift
//  UIPageViewController
//
//  Created by yurik on 5/26/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentetion()
    }
    
 //метод который будет запускать PageViewController
    func startPresentetion() {
        if let pageViewController = storyboard?.instantiateInitialViewController() as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
        }
            
        
    }

}

