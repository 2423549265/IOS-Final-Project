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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return titles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageIdentifier", for: indexPath)
        //let rowKey = messages.allKeys[indexPath.row] as! String
        
        //var image : UIImage?
        //        if let imageURL = URL(string:messages[rowKey] as! String),
        //            let imageData = try? Data(contentsOf: imageURL){
        //            //1
        //            image = UIImage(data:imageData)
        //            //2
        //        }
        
        // Configure the cell...
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = subTitles[indexPath.row]
        let imageSize = CGSize(width: 40, height: 40)
        cell.imageView?.image = UIImage(named: images[indexPath.row])?.reSizeImage(reSize: imageSize)
        cell.imageView!.layer.cornerRadius = 5
        cell.imageView!.layer.masksToBounds = true
        
        //        if image != nil {
        //            cell.imageView?.image = image!
        //        }
        
        
        return cell
    }
    
    
    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
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
