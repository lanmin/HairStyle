//
//  GroupBuyViewController.swift
//  HairStyle
//
//  Created by mac on 15/10/25.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

class GroupBuyViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let barItem = UIBarButtonItem(image: "nav_ip_sousuoicon", style: UIBarButtonItemStyle.Plain, target: self, action: "searchClick:")
     let itemR =  UIBarButtonItem(image: UIImage(named: "nav_ip_sousuoicon"), style: UIBarButtonItemStyle.Plain, target: self, action: "searchClick:")
     itemR.tintColor = UIColor.whiteColor()
     self.navigationItem.rightBarButtonItem = itemR
        
     self.topView()
        // Do any additional setup after loading the view.
    }

    func searchClick(sender:AnyObject)
    {
    
    }
    
    func topView()
    {
        let topView = UIView(frame: CGRectMake(0, 64, Screen_Width, 44))
        self.view.addSubview(topView)
        let arrTopView = ["全城","养发","价格不限","智能排序"]
        self.view.addSubview(topView)
        
        for(var i = 0; i < arrTopView.count; i++)
        {
            let btnWidth:CGFloat = 80
            let space:CGFloat = (Screen_Width - btnWidth * 4)/8
            let btn = UIButton(frame: CGRectMake(space + CGFloat(i) * (btnWidth + space * 2), 5, btnWidth, 44 - 10))
            btn.setTitle(arrTopView[i], forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: "jiantou_xiangxia"), forState:UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            topView.addSubview(btn)
            
            if(i != 0){
                let viewLine = UIView(frame: CGRectMake(CGFloat(i) * Screen_Width/4, 12, 1, 44 - 24))
                viewLine.backgroundColor = UIColor.grayColor()
                topView.addSubview(viewLine)
            }
            let viewLineBottom = UIView(frame: CGRectMake(0, 44, Screen_Width, 1))
            viewLineBottom.backgroundColor = UIColor.lightGrayColor()
            topView.addSubview(viewLineBottom)
        }

        
        
        
        
        
        let tableV = UITableView(frame: CGRectMake(0, 64 + 45, Screen_Width, Screen_Height - 64 - 45))//table的高度会再次计算
        tableV.delegate = self
        tableV.dataSource = self
        tableV.rowHeight = 80
        
        let nib = UINib(nibName: "MainHotTableViewCell", bundle: nil)
        tableV.registerNib(nib, forCellReuseIdentifier: "hotCell")
        self.view.addSubview(tableV)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("hotCell")
        return cell!
    }
}
