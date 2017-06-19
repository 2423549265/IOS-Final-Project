//
//  SignupViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/26.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmedPassword: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "signupSuccess"){
            usleep(700000)
            if(Signup){
                return true
            }
            else{
                let alert = UIAlertController(title: "注册失败", message: "用户名已存在", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
        }
        else{
            return true
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Signup = false
        
        signupButton.layer.masksToBounds = true
        signupButton.layer.cornerRadius = 8.0

        userName.placeholder = "用户名"
        userName.keyboardType = UIKeyboardType.default
        
        password.isSecureTextEntry = true
        password.placeholder = "密码"
        password.keyboardType = UIKeyboardType.default
        
        confirmedPassword.isSecureTextEntry = true
        confirmedPassword.placeholder = "确认密码"
        confirmedPassword.keyboardType = UIKeyboardType.default
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //print("Sign up")
        var command = "username="
        command.append(userName.text!)
        command.append("&pwd=")
        command.append(password.text!)
        RegisterGetRequest(command: command)
        //usleep(300000)
        print("Sign up")
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
