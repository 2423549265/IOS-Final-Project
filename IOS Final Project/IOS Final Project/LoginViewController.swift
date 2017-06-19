//
//  LoginViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/23.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBOutlet weak var passWordTextField: UITextField!
   
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "loginSuccess"){
            usleep(700000)
            if(Login == true){
                initializeUser(userID: userID)
                initializeConversations(userID: userID)
                return true
            }
            else{
                let alert = UIAlertController(title: "登录失败", message: "用户名或密码错误", preferredStyle: UIAlertControllerStyle.alert)
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
        //   userNameLabel.text = "用 户 名"
        //   passWordLabel.text = "密      码"
        //LoginButton.setTitle("登录", for: .normal)
        //signupButton.setTitle("注          册", for: .normal)
        
        LoginButton.layer.masksToBounds = true
        LoginButton.layer.cornerRadius = 8.0
        signupButton.layer.masksToBounds = true
        signupButton.layer.cornerRadius = 8.0
        
        signupButton.layer.borderWidth = 1.0
        if #available(iOS 10.0, *) {
            signupButton.layer.borderColor = UIColor(displayP3Red: 1.0, green: 0.8588, blue: 0.1804, alpha: 1.0).cgColor
        } else {
            // Fallback on earlier versions
        }
        
        
        userNameTextField.placeholder = "用户名"
        userNameTextField.keyboardType = UIKeyboardType.default
        
        passWordTextField.isSecureTextEntry = true
        passWordTextField.placeholder = "密码"
        passWordTextField.keyboardType = UIKeyboardType.default
        
        // passWordTextField.borderStyle = UITextBorderStyle.none
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        var command = "username="
        command.append(userNameTextField.text!)
        command.append("&pwd=")
        command.append(passWordTextField.text!)
        LoginGetRequest(command: command)
        userID = userNameTextField.text!
        selfPath = userDocumentPath + userID
        selfInfoPath = selfPath + "/" + "info/"
        conversationPath = selfPath + "/" + "conversations/"

        //usleep(300000)
        //print(Login)
       // Login = true
        if(Login){
            print("login")
           // performSegue(withIdentifier: "loginSuccess", sender: nil)
        }
        else{
            print("loginfalse")
        }
     //   UserInformationTableViewController.loginSuccess(<#T##UserInformationTableViewController#>)
    }
    
    @IBAction func signupFailure(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func signupSuccess(segue: UIStoryboardSegue){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passWordTextField.resignFirstResponder()
        userNameTextField.resignFirstResponder()
    }
    
    
}

