//
//  MyPageViewController.swift
//  HairStyle
//
//  Created by mac on 15/10/25.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

class MyPageViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return (section==0) ?0:20
    }
    


}
