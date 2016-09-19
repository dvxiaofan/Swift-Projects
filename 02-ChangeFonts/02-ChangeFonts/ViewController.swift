//
//  ViewController.swift
//  02-ChangeFonts
//
//  Created by xiaofans on 16/9/3.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontTableView: UITableView!
    
    // 显示数据
    lazy var data = ["张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦",
        "张小烦张小烦张小烦张小烦张小烦",
        "张小烦张小烦张小烦张小烦"]
    // 保存 font 的数组
    lazy var fontNames = [String]()
    var fontIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableView.delegate = self
        fontTableView.dataSource = self
        
        // 遍历 font
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                fontNames.append(font)
            }
        }
    }
    
    // 切换 font
    @IBAction func changeFontClick(sender: AnyObject) {
        fontIndex = (fontIndex + 1) % fontNames.count
        fontTableView.reloadData()
        
        print(fontNames[fontIndex])
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("testCell", forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 16)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}











