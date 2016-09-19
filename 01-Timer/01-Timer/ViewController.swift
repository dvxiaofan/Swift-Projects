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
    var timer = NSTimer()
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    @IBAction func beginBtnClick(sender: AnyObject) {
        if isPlaying {
            return
        }
        beginBtn.enabled = false
        pauseBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateCounter", userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseBtnClick(sender: AnyObject) {
        beginBtn.enabled = true
        pauseBtn.enabled = false
        isPlaying = false
        // 计时器停止
        timer.invalidate()
    }
    
    @IBAction func resetBtnClick(sender: AnyObject) {
        timer.invalidate()
        beginBtn.enabled = true
        pauseBtn.enabled = false
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    @objc private func updateCounter() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
}












