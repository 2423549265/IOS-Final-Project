//
//  ConversationTableViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class ConversationTableViewController: UITableViewController {

    @IBOutlet weak var typeBar: UIToolbar!
    
    let singleLineHeight = 16
    let singleWordLength = 15
    let singleLineMaxWord = 13
    let heightAdjustment = 14
    
    let imageLength = 30
    let imageHeight = 30
    
    let cellHeightWithTime = 50.5
    let cellHeightWithoutTime = 20.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalConversationHeight = 0.0
        ConversationCellHeight = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.conversationController = self
        
        //conversations[currentConversation].initialize(selfID: userID, theOtherID: "110", lastSentence: conversations[currentConversation].lastSentence)
        
        //conversations[currentConversation] = conversations[0]
        tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
//        Thread.detachNewThreadSelector(#selector(self.askForMessage),
//                                       toTarget: self, with: nil)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let nib = UINib(nibName: "ConversationTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ConversationIdentifier")
        hideTableViewExtraCellLine(tableView: tableView)
        
        self.navigationItem.title = "朋友一"
        
        let scrollIndexPath = IndexPath(row: conversations[currentConversation].whos.count - 1, section: 0)
        self.tableView.scrollToRow(at: scrollIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
       
        let delayQueue = DispatchQueue(label:"com.nju.ios.delayqueue", qos: .userInitiated)
        let additionalTime:DispatchTimeInterval = .microseconds(1000)
        delayQueue.asyncAfter(deadline: .now() + additionalTime, execute: {
            self.tableView.scrollToRow(at: scrollIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
        })
        
        
        
    }

//    func askForMessage(){
//        while(true){
//            if(whetherReceive){
//                self.reload()
//                whetherReceive = false
//            }
//            sleep(1)
//        }
//    }
    
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
        if(hasInitialConversation == true){
            return 0
        }
        else{
            return conversations[currentConversation].times.count
        }
    }

    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationIdentifier", for: indexPath) as! ConversationTableViewCell
        
        //print((messages[indexPath.row] as NSString).length)
        let flag = showTimeLabel(index: indexPath.row)
        let time = conversations[currentConversation].times[indexPath.row].components(separatedBy: " ")
        if (flag > 0){
            if(flag == 1){
                cell.time?.frame = CGRect(x: 126.5, y: 10.0, width: 120.0, height: 13)
                cell.time?.text = time[0] + "年" + time[1] + "月" + time[2] + "日" + " " + time[3] + ":" + time[4]
            }
            else if(flag == 2){
                cell.time?.frame = CGRect(x: 144.5, y: 10.0, width: 84.0, height: 13)
                cell.time?.text = time[1] + "月" + time[2] + "日" + " " + time[3] + ":" + time[4]
            }
            else{
                cell.time?.frame = CGRect(x: 166.5, y: 10.0, width: 40.0, height: 13)
                cell.time?.text = time[3] + ":" + time[4]
            }
            cell.time!.layer.cornerRadius = 5
            cell.time!.layer.masksToBounds = true
        }
        else{
            cell.time?.text = ""
            cell.time?.backgroundColor = UIColor.white
           
        }
        
        if(conversations[currentConversation].whos[indexPath.row]==1){
            cell.myMessage?.setTitle("", for: .normal)
            cell.myMessage?.backgroundColor = UIColor.clear
            cell.myMessageArrow?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            cell.message?.setTitle(conversations[currentConversation].messages[indexPath.row], for: .normal)
            cell.message.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.message.backgroundColor = UIColor(colorLiteralRed: 0.98, green: 0.85, blue: 0.38, alpha: 1)
            var imageHeight = 0
            
            if((conversations[currentConversation].messages[indexPath.row] as NSString).length < singleLineMaxWord){ //单行
                let rowHeight = 30
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                cell.message?.frame = CGRect(x: 50, y: imageHeight, width: (conversations[currentConversation].messages[indexPath.row] as NSString).length * singleWordLength + 20, height: 30)
            }
            else{//多行
                let row = (conversations[currentConversation].messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
                let rowHeight = row * singleLineHeight + heightAdjustment
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                
                cell.message?.frame = CGRect(x: 50, y: imageHeight, width: singleLineMaxWord * singleWordLength + 20, height: rowHeight)
            }
            cell.message?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
            cell.message?.titleLabel?.lineBreakMode = .byWordWrapping
            cell.message!.layer.cornerRadius = 5
            cell.message!.layer.masksToBounds = true
            
            print(conversations[currentConversation].images[indexPath.row])
            
            if(conversations[currentConversation].theOtherID == "110"){
                cell.profile?.image = #imageLiteral(resourceName: "系统头像")
            }
            else{
                cell.profile?.image = UIImage(named: conversations[currentConversation].images[indexPath.row])
            }
            cell.profile?.frame = CGRect(x: 10, y: imageHeight, width: 30, height: 30)
            cell.myProfile?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
            cell.messageButton?.frame = CGRect(x: 42, y: imageHeight + 10, width: 10, height: 10)
        }
        else{
            cell.messageButton?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            cell.message?.setTitle("", for: .normal)
            cell.message?.backgroundColor = UIColor.clear
            cell.myMessage?.setTitle(conversations[currentConversation].messages[indexPath.row], for: .normal)
            cell.myMessage.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.myMessage.backgroundColor = UIColor(colorLiteralRed: 0.79, green: 0.79, blue: 0.79, alpha: 1)
            var imageHeight = 0
            
            if((conversations[currentConversation].messages[indexPath.row] as NSString).length < singleLineMaxWord){ //单行
                let rowHeight = 30
                imageHeight = Int(cell.frame.height) - rowHeight - 10
                cell.myMessage?.frame = CGRect(x: 305 - (conversations[currentConversation].messages[indexPath.row] as NSString).length * singleWordLength, y: imageHeight, width: (conversations[currentConversation].messages[indexPath.row] as NSString).length * singleWordLength + 20, height: 30)
            }
            else{//多行  316
                let row = (conversations[currentConversation].messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
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

            
            cell.myProfile?.image = UIImage(named: conversations[currentConversation].images[indexPath.row])
            cell.myProfile?.frame = CGRect(x: 335, y: imageHeight, width: 30, height: 30)
            cell.profile?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
            cell.myMessageArrow?.frame = CGRect(x: 323, y: imageHeight + 10, width: 10, height: 10)
        }
        // Configure the cell...

        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = (conversations[currentConversation].messages[indexPath.row] as NSString).length / singleLineMaxWord + 1
        let textHeight = row * singleLineHeight + 15
        var sum = 0.0
        
        let flag = showTimeLabel(index: indexPath.row)
        if(flag > 0){
            sum = (Double)(textHeight) + cellHeightWithTime
        }
        else{
            sum = (Double)(textHeight) + cellHeightWithoutTime
        }
        
        if(indexPath.row < 10){
            ConversationCellHeight[indexPath.row] = sum
        }
        
        return CGFloat(sum)
    }
    
    func reload(){
        self.tableView.reloadData()
        
        
        let scrollIndexPath = IndexPath(row: conversations[currentConversation].whos.count - 1, section: 0)
        self.tableView.scrollToRow(at: scrollIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
        
        let delayQueue = DispatchQueue(label:"com.nju.ios.delayqueue", qos: .userInitiated)
        let additionalTime:DispatchTimeInterval = .microseconds(1000)
        delayQueue.asyncAfter(deadline: .now() + additionalTime, execute: {
            self.tableView.scrollToRow(at: scrollIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
        })
    }

    func showTimeLabel(index: Int) -> Int{
        
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy MM dd HH mm"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        let nowTime = strNowTime.components(separatedBy: " ")
        
        if(index == 0){
            let time = conversations[currentConversation].times[index].components(separatedBy: " ")
            if(time[0] != nowTime[0]){
                return 1
            }
            else if(time[2] != nowTime[2]){
                return 2
            }
            else{
                return 3
            }

        }
        else{
            let timediffer = timeDiffer(current: conversations[currentConversation].times[index], last: conversations[currentConversation].times[index - 1])
            if(timediffer <= 5){
                return -1
            }
            else{
                let time = conversations[currentConversation].times[index].components(separatedBy: " ")
                if(time[0] != nowTime[0]){
                    return 1
                }
                else if(time[2] != nowTime[2]){
                    return 2
                }
                else{
                    return 3
                }
            }
        }
    }
    
    func timeDiffer(current: String, last: String) -> Int{
        let curTime = current.components(separatedBy: " ")
        let lastTime = last.components(separatedBy: " ")
        if(curTime[0] != lastTime[0] || curTime[1] != lastTime[1] || curTime[2] != lastTime[2]){
            return 100
        }
        else{
            let curHour = Int(curTime[3])
            let lastHour = Int(lastTime[3])
            let curMin = Int(curTime[4])
            let lastMin = Int(lastTime[4])
            return (curHour! - lastHour!) * 60 + curMin! - lastMin!
        }
    }    /*
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
