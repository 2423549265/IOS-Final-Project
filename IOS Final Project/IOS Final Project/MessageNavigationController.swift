//
//  MessageNavigationController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/12.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class MessageNavigationController: UINavigationController {

    @IBOutlet weak var messageTabBarItem: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.messageNavigation = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUnreadMessages(){
        if(totalUnReadMessagesNum == 0){
            messageTabBarItem.badgeValue = nil
        }
        else{
            print("diaoyongle")
            messageTabBarItem.badgeValue = String(totalUnReadMessagesNum)
       // self.reloadInputViews()
        }
        self.reloadInputViews()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
