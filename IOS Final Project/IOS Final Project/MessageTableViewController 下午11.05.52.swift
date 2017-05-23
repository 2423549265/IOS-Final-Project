//
//  MessageTableViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/16.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import CoreImage

//let dataSourceURL = URL(string:"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist")

let imageSource = "/Users/albert/Documents/大学课程/大三下/移动互联/IOS Final Project/消息头像"

extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height));
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
}

class MessageTableViewController: UITableViewController {
    
    //lazy var messages = NSDictionary(contentsOf:dataSourceURL!)!
    var titles = ["朋友1", "朋友2"];
    var subTitles = ["7点开黑", "9点吃夜宵"];
    var images = [imageSource + "/1.jpg", imageSource + "/2.jpg"];
    var times = ["今天 13:13", "今天 07:35"]
    var count = ["1", "11"]
    
    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        hideTableViewExtraCellLine(tableView: tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "MessageTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "messageIdentifier")
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
        return titles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageIdentifier", for: indexPath) as! MessageTableViewCell
        
        let imageSize = CGSize(width: 40, height: 40)
        cell.imageView?.image = UIImage(named: images[indexPath.row])?.reSizeImage(reSize: imageSize)
        cell.imageView!.layer.cornerRadius = 5
        cell.imageView!.layer.masksToBounds = true
        
        cell.name?.text = titles[indexPath.row]
        cell.message?.text = subTitles[indexPath.row]
        cell.timeLabel?.text = times[indexPath.row]
        cell.notLabel?.text = count[indexPath.row]
        cell.notLabel!.layer.cornerRadius = 8
        cell.notLabel!.layer.masksToBounds = true
        
        //print(indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: NSIndexPath){
        print(indexPath)
        
        //let conversation = ConversationTableViewController.init();
        //self.navigationController?.pushViewController(conversation, animated: true)
        //[self.navigationController pushViewController:conversation animated:YES];
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
