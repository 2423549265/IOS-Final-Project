//
//  DetailCommodityViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/6/17.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class DetailCommodityViewController: UIViewController {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profile.image = #imageLiteral(resourceName: "theOtherProfile")
        name.text = theOtherUser.name
        price.text = "¥" + commodities[currentCommodity].price
        bookName.text = "  标题: " + commodities[currentCommodity].name
        bookDescription.text = "  介绍: " + commodities[currentCommodity].introduction
        pic1.image = #imageLiteral(resourceName: "书1")
        pic2.image = #imageLiteral(resourceName: "书2")
        
        contactButton.layer.masksToBounds = true
        contactButton.layer.cornerRadius = 8.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func contactSeller(_ sender: UIButton) {
        if(!Login){
            performSegue(withIdentifier: "Login", sender: nil)
        }
        else{
            
        
            var flag = false
            for (index,conversation) in conversations.enumerated(){
                if theOtherUser.user_id == conversation.theOtherID{
                    flag = true
                    currentConversation = index
                }
            }
        
            if(flag == false){
        
                initialConversation.initialize(selfID: currentUser.user_id, theOtherID_Name: theOtherUser.user_id + "_" + theOtherUser.name)
                conversations.append(initialConversation)
                currentConversation = conversations.count - 1
            }
            performSegue(withIdentifier: "contactuser", sender: nil)
        }
    }
    
    @IBAction func backFromConversation(segue:UIStoryboardSegue){
        
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
