//
//  ViewController.swift
//  test
//
//  Created by Albert on 2017/5/8.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func scheduleNotification(){
        //清除所有本地推送
        UIApplication.shared.cancelAllLocalNotifications()
        
        //创建UILocalNotification来进行本地消息通知
        let localNotification = UILocalNotification()
        //设置应用程序右上角的提醒个数
        localNotification.applicationIconBadgeNumber = 78;
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

