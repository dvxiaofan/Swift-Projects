//
//  ViewController.swift
//  01-Timer
//
//  Created by xiaofans on 16/9/3.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func beginBtnClick(_ sender: AnyObject) {
        if isPlaying {
            return
        }
        beginBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseBtnClick(_ sender: AnyObject) {
        beginBtn.isEnabled = true
        pauseBtn.isEnabled = false
        isPlaying = false
        // 计时器停止
        timer.invalidate()
    }
    
    @IBAction func resetBtnClick(_ sender: AnyObject) {
        timer.invalidate()
        beginBtn.isEnabled = true
        pauseBtn.isEnabled = false
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    @objc fileprivate func updateCounter() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
}












