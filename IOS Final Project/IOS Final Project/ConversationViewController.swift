//
//  ConversationViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/23.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var titleItem: UINavigationItem!
    
    @IBOutlet weak var message: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.titleItem.title = conversations[currentConversation].theOtherName
        let childViewController = ConversationTableViewController.init()
        childViewController.view.frame = CGRect(x: 0, y: 64, width: 375, height: 560)
        self.addChildViewController(childViewController)
        self.view.addSubview(childViewController.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillHide(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ConversationViewController.viewTap(sender:)))
        self.view.addGestureRecognizer(gesture)

        
        //inputTextField.frame = CGRect(x: 0, y: 0, width: 355, height: 30)
    }

    override func viewWillAppear(_ animated: Bool) {
        totalUnReadMessagesNum -= conversations[currentConversation].unReadMessagesNum
        conversations[currentConversation].unReadMessagesNum = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        totalUnReadMessagesNum -= conversations[currentConversation].unReadMessagesNum
        conversations[currentConversation].unReadMessagesNum = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewTap(sender:UITapGestureRecognizer){
        // print("b")
        self.view.endEditing(true)
        
    }
    
    /* override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     print("a")
     self.view.endEditing(true)
     }*/
    
    func keyboardWillShow(note:Notification) {
        
        let dic:NSDictionary = note.userInfo! as NSDictionary
        
        // print(dic["UIKeyboardFrameEndUserInfoKey"]!)
        let a:AnyObject? = dic.object(forKey: UIKeyboardFrameEndUserInfoKey) as AnyObject?
        //  let endY = a?.cgRectValue.origin.y
        let height = a?.cgRectValue.height
        var frame = self.view.frame
        
        totalConversationHeight = ConversationCellHeight.reduce(0, {$0 + $1})
        
        let restHeight = 560 - totalConversationHeight
        
        frame.origin.y = -height!

        if(restHeight > 0){
            if(Float(height!) - Float(restHeight) <= 0){
                self.childViewControllers[0].view.frame = CGRect(x: 0, y: 64 + height!, width: 375, height: 560 - height!)
            }
            else{
                self.childViewControllers[0].view.frame = CGRect(x: 0, y: 64 + restHeight, width: 375, height: 560 - restHeight)
            }
        }
        self.view.frame = frame
        
    }
    
    func keyboardWillHide(note:Notification) {
        
        var frame = self.view.frame
        frame.origin.y = 0
        self.childViewControllers[0].view.frame = CGRect(x: 0, y: 64, width: 375, height: 560)
        self.view.frame = frame
    }

    
    @IBAction func sendMessage(_ sender: UIButton) {
        if(hasInitialConversation == true){
            conversations.append(initialConversation)
            currentConversation = conversations.count - 1
            hasInitialConversation = false
        }
        
        var command = "sendid=" + conversations[currentConversation].selfID + "&receiverid=" + conversations[currentConversation].theOtherID
        command.append("&message=")
        command.append(message.text!)
        command.append("&name=")
        command.append(currentUser.name)
        sendAMessage(command: command)
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy MM dd HH mm"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        
        conversations[currentConversation].addNewMessage(time: strNowTime, message: message.text!, who: 2)
        conversations[currentConversation].lastSentence = message.text!
        (self.childViewControllers.first as! ConversationTableViewController).reload()
        message.text?.removeAll()
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
