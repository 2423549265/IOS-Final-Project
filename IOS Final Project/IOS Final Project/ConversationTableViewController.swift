//
//  ConversationTableViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class ConversationTableViewController: UITableViewController {

    var times = ["10:27", "11:04", "11:16","11:40","11:55"];
    var messages = ["7点开黑，说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了", "好的，那我们9点吃夜宵吧", "啊，说的我肚子都饿了，估计我撑不到9点了，八点半去怎么样？","啊，说的我肚子都饿了，估计我撑不到9点了，八点半去怎么样？","7点开黑，说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了说的我肚子都饿了，估计我撑不到9点了"];
    var images = [imageSource + "/1.jpg", imageSource + "/2.jpg", imageSource + "/1.jpg",imageSource + "/2.jpg", imageSource + "/1.jpg"];
    var who = [1,2,1,2,1]
    
    let singleLineHeight = 15
    let singleWordLength = 15
    let singleLineMaxWord = 13
    let heightAdjustment = 15
    
    let imageLength = 30
    let imageHeight = 30
    
    let cellHeightWithTime = 50.5
    let cellHeightWithoutTime = 20.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let nib = UINib(nibName: "ConversationTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ConversationIdentifier")
        hideTableViewExtraCellLine(tableView: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return times.count
    }

    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationIdentifier", for: indexPath) as! ConversationTableViewCell
        
        //print((messages[indexPath.row] as NSString).length)
        
        if (showTimeLabel(index: indexPath.row)){
            cell.time?.text = times[indexPath.row]
            cell.time?.frame = CGRect(x: 166.5, y: 10.0, width: 40.0, height: 13)
            cell.time!.layer.cornerRadius = 5
            cell.time!.layer.masksToBounds = true
        }
        else{
            cell.time?.text = ""
            cell.time?.backgroundColor = UIColor.white
           
        }
        
        if(who[indexPath.row]==1){
            cell.myMessage?.setTitle("", for: .normal)
            cell.myMessage?.backgroundColor = UIColor.clear
            cell.myMessageArrow?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            cell.message?.setTitle(messages[indexPath.row], for: .normal)
            cell.message.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            var imageHeight = 0
            
            if((messages[indexPath.row] as NSString).length < singleLineMaxWord){ //单行
                let rowHeight = 30
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                cell.message?.frame = CGRect(x: 50, y: imageHeight, width: (messages[indexPath.row] as NSString).length * singleWordLength + 20, height: 30)
            }
            else{//多行
                let row = (messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
                let rowHeight = row * singleLineHeight + heightAdjustment
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                
                cell.message?.frame = CGRect(x: 50, y: imageHeight, width: singleLineMaxWord * singleWordLength + 20, height: rowHeight)
            }
            cell.message?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
       
            cell.message?.titleLabel?.lineBreakMode = .byWordWrapping
            cell.message!.layer.cornerRadius = 5
            cell.message!.layer.masksToBounds = true
        
            cell.profile?.image = UIImage(named: images[indexPath.row])
            cell.profile?.frame = CGRect(x: 10, y: imageHeight, width: 30, height: 30)
            
            cell.messageButton?.frame = CGRect(x: 42, y: imageHeight + 10, width: 10, height: 10)
        }
        else{
            cell.messageButton?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            cell.message?.setTitle("", for: .normal)
            cell.message?.backgroundColor = UIColor.clear
            cell.myMessage?.setTitle(messages[indexPath.row], for: .normal)
            cell.myMessage.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            var imageHeight = 0
            
            if((messages[indexPath.row] as NSString).length < singleLineMaxWord){ //单行
                let rowHeight = 30
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                cell.myMessage?.frame = CGRect(x: 305 - (messages[indexPath.row] as NSString).length * singleWordLength, y: imageHeight, width: (messages[indexPath.row] as NSString).length * singleWordLength + 20, height: 30)
            }
            else{//多行  316
                let row = (messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
                let rowHeight = row * singleLineHeight + heightAdjustment
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                cell.myMessage?.frame = CGRect(x: 305 - singleLineMaxWord * singleWordLength, y: imageHeight, width: singleLineMaxWord * singleWordLength + 20, height: rowHeight)
            }
            cell.myMessage?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
            // cell.message?.
            // button.titleLabel?.lineBreakMode = .byWordWrapping  自动换行
            cell.myMessage?.titleLabel?.lineBreakMode = .byWordWrapping
            
            cell.myMessage!.layer.cornerRadius = 5
            cell.myMessage!.layer.masksToBounds = true

            
            cell.myProfile?.image = UIImage(named: images[indexPath.row])
            cell.myProfile?.frame = CGRect(x: 335, y: imageHeight, width: 30, height: 30)
            
            cell.myMessageArrow?.frame = CGRect(x: 323, y: imageHeight + 10, width: 10, height: 10)
        }
        // Configure the cell...

        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = (messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
        let textHeight = row * singleLineHeight + 15
        var sum = 0.0
        
        if(showTimeLabel(index: indexPath.row)){
            sum = (Double)(textHeight) + cellHeightWithTime
        }
        else{
            sum = (Double)(textHeight) + cellHeightWithoutTime
        }
        
        return CGFloat(sum)
    }

    func showTimeLabel(index: Int) -> Bool{
        if(index == 0 || index == 2){
            return true
        }
        else{
            return false
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
