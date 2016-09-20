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
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                fontNames.append(font)
            }
        }
    }
    
    // 切换 font
    @IBAction func changeFontClick(_ sender: AnyObject) {
        fontIndex = (fontIndex + 1) % fontNames.count
        fontTableView.reloadData()
        
        print(fontNames[fontIndex])
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        cell.textLabel?.backgroundColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 16)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}











