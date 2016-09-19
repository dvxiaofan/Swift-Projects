//
//  ViewController.swift
//  03-LoginAnimation
//
//  Created by xiaofans on 16/9/3.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func backBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}





















