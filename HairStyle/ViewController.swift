//
//  ViewController.swift
//  HairStyle
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableV = UITableView(frame: UIScreen.mainScreen().bounds);
        self.view.addSubview(tableV)
        tableV.delegate = self;
        tableV.dataSource = self;
        tableV.registerClass(UITableViewCell.self, forCellReuseIdentifier: "aaa")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("aaa", forIndexPath: indexPath)
        cell.textLabel?.text = "bbb"
        return cell
    }

}

