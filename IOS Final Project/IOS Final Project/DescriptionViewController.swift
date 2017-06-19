//
//  DescriptionViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/13.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var des: UITextField!
    @IBOutlet weak var save: UIBarButtonItem!

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier=="changedes"){
            currentUser.user_decription = des.text!
            updateUserInformation(type: "description", demand: "name=" + des.text! + "&id=" + currentUser.user_id)
            return true
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
