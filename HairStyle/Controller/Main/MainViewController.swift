//
//  MainViewController.swift
//  HairStyle
//
//  Created by mac on 15/10/25.
//  Copyright © 2015年 bearapp. All rights reserved.
//  首页分为五个部分，分为view1Carousel(轮播图),view2Types（美发类型）,view3LimitTimeBuy（限时抢购）,view4Hot（热门团购）,view5All（全部团购）  用scrollView依次从上到下加载。

import UIKit
let Height_CarouSel:CGFloat = 160
let space:CGFloat = 10
let height_view2:CGFloat = 30 * 2 + 45 * 2;
let height_view3:CGFloat = 160;
let height_view4:CGFloat = 40 + 5 + 10 * 80 //后面需要修改，tableView的高度是动态的

class MainViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    var scrollV:UIScrollView?//声明一个UIScrollView类型的变量，用来作为容器方便屏幕滑动。
    var circleView:CirCleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha:1)
        self.createScroll();
        self.createView1Carousel()
        self.createView2Types()
        self.view3LimitTimeBuy()
        self.view4Hot()
        scrollV!.contentSize = CGSizeMake(Screen_Width, Height_CarouSel + height_view2 + height_view3 + height_view4 + space * 2)
    }

    func createScroll()
    {
        scrollV = UIScrollView(frame: CGRectMake(0, 0,Screen_Width,Screen_Height));
        self.view.addSubview(scrollV!)
    }
    
    func createView1Carousel()
    {
        let imageArray: [UIImage!] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg")]
        
        self.circleView = CirCleView(frame: CGRectMake(0, 0, Screen_Width, CGFloat(Height_CarouSel)), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        scrollV!.addSubview(circleView)
    }
    
    func createView2Types()
    {
       
        let width_btn = (Screen_Width - 15*6)/3
        let view2 = UIView(frame: CGRectMake(0, Height_CarouSel, Screen_Width, height_view2))
        let arrView2 = [["index_iocn_xijianchui","洗剪吹"],["index_iocn_ranfai","染发"],["index_iocn_xijianchui","烫发"],["index_iocn_yanfa","养发"],["index_iocn_zaofa","造型"],["index_iocn_meirong","美容"]]
        
        view2.backgroundColor = UIColor.whiteColor()
        var t = 0
        for var i = 0; i < 2;i++
        {
            for var j = 0; j < 3; j++
            {
                let btn = UIButton(frame: CGRectMake(CGFloat(15 + j * Int(width_btn + 30)),CGFloat(15 + i*(45 + 30)), width_btn, 45));
                btn.setImage(UIImage(named:arrView2[t][0]), forState: UIControlState.Normal)
                btn.setTitle(arrView2[t][1], forState: UIControlState.Normal)
                btn.titleLabel!.font = UIFont.systemFontOfSize(13)
                btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
                btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
                view2.addSubview(btn);
                t++
            }
        }
        //添加竖方向的一条线
        let imageV = UIImageView(frame: CGRectMake(15, height_view2/2, Screen_Width - 30, 1))
        imageV.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        view2.addSubview(imageV)
        
        //添加横方向的两条线
        let imageV1 = UIImageView(frame: CGRectMake(30 + width_btn, 15, 1, height_view2 - 30))
        imageV1.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        view2.addSubview(imageV1)
        
        let imageV2 = UIImageView(frame: CGRectMake(2 * (30 + width_btn), 15, 1, height_view2 - 30))
        imageV2.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        view2.addSubview(imageV2)
        
        scrollV!.addSubview(view2)

    }
    
    func view3LimitTimeBuy()
    {
        let height:CGFloat = 30;//限时抢购图片的高度
        let view3 = UIView(frame: CGRectMake(0, Height_CarouSel + height_view2 + space, Screen_Width, height_view3));
        view3.backgroundColor = UIColor.whiteColor();
        scrollV!.addSubview(view3)
        
        let imgVLeft = UIImageView(frame: CGRectMake(10, 10, 100, height))
        imgVLeft.image = UIImage(named:"index_qianggou");
        view3.addSubview(imgVLeft)
        
        let labelRight = UILabel(frame: CGRectMake(Screen_Width - 5 - 150, 15, 150, 20))
        labelRight.text = "距离开始 13:14:49"
        view3.addSubview(labelRight)
        
        let btnRight = UIButton(frame: CGRectMake(Screen_Width - 5 - 10, 15, 10, 20))
        btnRight.setImage(UIImage(named: "index_gengduo_jiantou"), forState: UIControlState.Normal)
        view3.addSubview(btnRight)
        
        let scrollView3 = UIScrollView(frame: CGRectMake(0,height + 20, Screen_Width, height_view3 - 50));
        let arrView3 = [["third.jpg","show life Salon","1元洗吹造型套餐","1元","60元"],["third.jpg","show life Salon","1元洗吹造型套餐","1元","60元"],["third.jpg","show life Salon","1元洗吹造型套餐","1元","60元"],["third.jpg","show life Salon","1元洗吹造型套餐","1元","60元"],["third.jpg","show life Salon","1元洗吹造型套餐","1元","60元"]];
        
        for var i = 0; i < arrView3.count; i++
        {
            let view = UIView(frame: CGRectMake(CGFloat(i) * Screen_Width/3 , 0, Screen_Width/3, height_view3 - 50))
            //view.backgroundColor = UIColor.redColor();
            scrollView3.addSubview(view);
            
            let btnTop = UIButton(frame: CGRectMake(10, 0, 80, 50))
            btnTop.setImage(UIImage(named: arrView3[i][0]), forState:UIControlState.Normal)
            view.addSubview(btnTop)
            
            let labelShopName = UILabel(frame: CGRectMake(3, 50, view.frame.size.width, 20))
            labelShopName.text = arrView3[i][1];
            labelShopName.textColor = UIColor.darkGrayColor()
            labelShopName.font = UIFont.systemFontOfSize(14)
            view.addSubview(labelShopName)
            
            let labelType = UILabel(frame: CGRectMake(3, 50 + 20, view.frame.size.width, 20))
            labelType.text = arrView3[i][2];
            labelType.textColor = UIColor.lightGrayColor()
            labelType.font = UIFont.systemFontOfSize(12)
            view.addSubview(labelType)
            
            let labelNprice = UILabel(frame: CGRectMake(20, 50 + 20 + 20, 20, 20))
            labelNprice.text = arrView3[i][3];
            labelNprice.textColor = UIColor.lightGrayColor()
            labelNprice.font = UIFont.systemFontOfSize(12)
            view.addSubview(labelNprice)
            
            let labelOldPrice = UILabel(frame: CGRectMake(20 + 20, 50 + 20 + 20, 30, 20))
            labelOldPrice.text = arrView3[i][4];
            labelOldPrice.textColor = UIColor.lightGrayColor()
            labelOldPrice.font = UIFont.systemFontOfSize(12)
            view.addSubview(labelOldPrice)
            
        }
        view3.addSubview(scrollView3)
        scrollView3.contentSize = CGSizeMake(CGFloat(arrView3.count) * Screen_Width/3, height_view3 - 50)
        view3.addSubview(scrollView3)
    }
    
    func view4Hot()
    {
        let view4 = UIView(frame: CGRectMake(0, Height_CarouSel + height_view2 + space + height_view3 + space, Screen_Width,height_view4))
        view4.backgroundColor = UIColor.whiteColor();
        scrollV!.addSubview(view4)
        
        let imgVLeft = UIImageView(frame: CGRectMake(10, 10, 15, 15))
        imgVLeft.image = UIImage(named:"index_remen");
        view4.addSubview(imgVLeft)
        
        let labelRight = UILabel(frame: CGRectMake(40, 10, 150, 20))
        labelRight.text = "热门团购"
        view4.addSubview(labelRight)
        
        let imgVLine = UIImageView(frame: CGRectMake(0, 40, Screen_Width, 1))
        imgVLine.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
        view4.addSubview(imgVLine)
        
        let tableV = UITableView(frame: CGRectMake(0, 40 + 5, Screen_Width, 10 * 80))//table的高度会再次计算
        tableV.delegate = self
        tableV.dataSource = self
        tableV.rowHeight = 80
        
        let nib = UINib(nibName: "MainHotTableViewCell", bundle: nil)
        tableV.registerNib(nib, forCellReuseIdentifier: "hotCell")
        view4.addSubview(tableV)
        
//         self.tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, self.tableView.frame.size.width, 0.01))
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

//    
//    func view5All()->UIView
//    {
//        
//    }
    

}
