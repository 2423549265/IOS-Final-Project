//
//  FindViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/24.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit



class FindViewController: UIViewController {
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        let childViewController = FindCollectionViewController.init(collectionViewLayout: UICollectionViewFlowLayout.init())
        childViewController.view.frame = CGRect(x: 0, y: 300, width: 375, height: 375)
        self.addChildViewController(childViewController)
        self.view.addSubview(childViewController.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginFailure(segue:UIStoryboardSegue){
        
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
