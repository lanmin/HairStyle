//
//  AppDelegate.swift
//  HairStyle
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //初始化self.window
        self.window = UIWindow(frame:Screen_Bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        //添加四个页面，并给每个页面添加导航栏
        let vcMain = MainViewController()//首页
        //vcMain.title = "首页"
        vcMain.tabBarItem.title = "首页"
        vcMain.tabBarItem.image = UIImage(named:"icon_index");
        let navMain = UINavigationController(rootViewController:vcMain);
        navMain.navigationBar.barTintColor = UIColor(red: 185/255.0, green: 45/255.0, blue: 48/255.0, alpha: 1);
        
        let textF = UITextField(frame: CGRectMake(Screen_Width/2 - 100, 5, 200, 30))
        textF.borderStyle = UITextBorderStyle.RoundedRect
        textF.layer.cornerRadius = 14;
        textF.placeholder = "请输入门店名称"
        navMain.navigationBar.addSubview(textF)
        
        let labelLeft = UILabel(frame: CGRectMake(10, 0, 40, 44))
        labelLeft.font = UIFont.systemFontOfSize(15)
        labelLeft.text = "西安"
        labelLeft.textColor = UIColor.whiteColor();
        navMain.navigationBar.addSubview(labelLeft)
        
        let btnLeft = UIButton(frame: CGRectMake(10 + 30 + 2, 44/2 - 2.5, 8, 8))
    btnLeft.setBackgroundImage(UIImage(named:"nav_diqu"), forState:UIControlState.Normal)
        navMain.navigationBar.addSubview(btnLeft)
        
        let btnRight = UIButton(frame: CGRectMake(Screen_Width - 30, 5, 10, 30))
        btnRight.setBackgroundImage(UIImage(named:"nav_gengduo"), forState:UIControlState.Normal)
        navMain.navigationBar.addSubview(btnRight)
        
        let vcStylist = StylistViewController()//发型师
        vcStylist.tabBarItem.title = "理发"
        vcStylist.tabBarItem.image = UIImage(named:"icon_hot");
        let navStylist = UINavigationController(rootViewController:vcStylist);
        navStylist.navigationBar.barTintColor = UIColor(red: 185/255.0, green: 45/255.0, blue: 48/255.0, alpha: 1);//bug1 颜色和实际不一致

        
        let vcGroupBuy = GroupBuyViewController()//团购
        vcGroupBuy.title = "团购"
        vcGroupBuy.tabBarItem.image = UIImage(named:"icon_activity");
        let navGroupBuy = UINavigationController(rootViewController:vcGroupBuy);
        navGroupBuy.navigationBar.barTintColor = UIColor(red: 185/255.0, green: 45/255.0, blue: 48/255.0, alpha: 1);
        
        
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        let vcMyPage = storyB.instantiateViewControllerWithIdentifier("MyPageViewControllerID")//我的页面
        vcMyPage.title = "我的"
        vcMyPage.tabBarItem.image = UIImage(named:"icon_my");
        let navMyPage = UINavigationController(rootViewController:vcMyPage);
        navMyPage.navigationBar.barTintColor = UIColor(red: 164/255.0, green: 29/255.0, blue: 34/255.0, alpha: 1);

        //创建导航栏并加载以上四个页面
        let tabBarVC = UITabBarController();
        tabBarVC.viewControllers = [navMain,navStylist,navGroupBuy,navMyPage];
        tabBarVC.tabBar.tintColor = UIColor.redColor();
        self.window!.rootViewController = tabBarVC;
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

