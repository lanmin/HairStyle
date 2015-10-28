//
//  StylistViewController.swift
//  HairStyle
//
//  Created by mac on 15/10/25.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

class StylistViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    var cellNumber = 1;
    var collectionCellHeight:CGFloat = 120
    override func viewDidLoad() {
        super.viewDidLoad()
        let segView = UISegmentedControl(items: ["作品集","发型师"])
        segView.frame = CGRectMake(Screen_Width/2 - 60, 5, 60 * 2, 30)
        segView.tintColor = UIColor.whiteColor()
        segView.selectedSegmentIndex = 0
        self.navigationController?.navigationBar .addSubview(segView)
        self.automaticallyAdjustsScrollViewInsets = false
        self.addTopView()
        self.addTableView()
    }

    func addTopView()
    {
        let topView = UIView(frame: CGRectMake(0, 64, Screen_Width, 44))
        let arrTopView = [["sc_distance","距离"],["sc_hot","热门"],["sc_new","最新"]]
        self.view.addSubview(topView)
        
        for(var i = 0; i < 3; i++)
        {
            let btnWidth:CGFloat = 80
            let space:CGFloat = (Screen_Width - btnWidth * 3)/6
            let btn = UIButton(frame: CGRectMake(space + CGFloat(i) * (btnWidth + space * 2), 5, btnWidth, 44 - 10))
            btn.setTitle(arrTopView[i][1], forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: arrTopView[i][0]), forState:UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            topView.addSubview(btn)
            
            if(i != 0){
                let viewLine = UIView(frame: CGRectMake(CGFloat(i) * Screen_Width/3, 12, 1, 44 - 24))
                viewLine.backgroundColor = UIColor.grayColor()
                topView.addSubview(viewLine)
            }
        }
        let viewLineBottom = UIView(frame: CGRectMake(0, 44, Screen_Width, 1))
        viewLineBottom.backgroundColor = UIColor.lightGrayColor()
        topView.addSubview(viewLineBottom)
    }
    
    
    func clickItem(sender:AnyObject)
    {
    
    }
    
    func addTableView()
    {
        let tv = UITableView(frame:CGRectMake(0,64+45, Screen_Width, Screen_Height - 64 - 44 - 44))
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 300
        self.view.addSubview(tv)
        let nib = UINib(nibName: "StylistTableViewCell", bundle: nil)
        tv.registerNib(nib, forCellReuseIdentifier: "StylistCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 9;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        print(300 - 128 + collectionCellHeight)
        return 300 - 128 + collectionCellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("StylistCell")
        let stylistCell:StylistTableViewCell = cell as! StylistTableViewCell
        stylistCell.collectionV?.dataSource = self
        stylistCell.collectionV?.delegate = self
        stylistCell.collectionV?.tag = indexPath.row
        
        stylistCell.collectionWidth?.constant = 240
        cellNumber = indexPath.row + 1
        if cellNumber == 1
        {
            stylistCell.collectionWidth?.constant = 125
            stylistCell.collectionHeight?.constant = 125
        }else if cellNumber == 2 || cellNumber == 3
        {
            stylistCell.collectionHeight?.constant = 81;
        }else if cellNumber == 4 || cellNumber == 5 || cellNumber == 6
        {
            stylistCell.collectionHeight?.constant = 81*2
        }else
        {
            stylistCell.collectionHeight?.constant = 81*3
        }
        collectionCellHeight = stylistCell.collectionHeight!.constant
        self.tableView(tableView,heightForRowAtIndexPath: indexPath)//待修改 放在这里不合适
        stylistCell.collectionV?.reloadData()
        return stylistCell
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        cellNumber = collectionView.tag + 1
        return cellNumber
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let collectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("StylistCollection", forIndexPath: indexPath)
        
        return collectionCell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if (collectionView.tag + 1) == 1
        {
            return CGSizeMake(120, 120)
        }
        
        
        return CGSizeMake(240/3 - 7, 240/3 - 7)
    }
}
