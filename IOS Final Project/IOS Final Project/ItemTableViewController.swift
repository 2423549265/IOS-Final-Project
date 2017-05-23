//
//  ItemTableViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/19.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import CoreImage

let imageSource_person = "/Users/albert/Documents/大学课程/大三下/移动互联/IOS Final Project/个人界面"

class ItemTableViewController: UITableViewController {
    
    var profiles = [imageSource_person + "/1.jpg", imageSource_person + "/1.jpg"]
    var names = ["李东岳", "李明亮"]
    var price = ["¥485", "¥485"]
    var photo1 = [imageSource_person + "/2.jpg", imageSource_person + "/2.jpg"]
    var photo2 = [imageSource_person + "/3.jpg", imageSource_person + "/3.jpg"]
    var photo3 = [imageSource_person + "/4.jpg", imageSource_person + "/4.jpg"]
    var intros = ["#复仇者联盟# 神奇四侠电影系列 银影侠 12寸 ～买家先验货后签字，快递员不给先验直接拒收，签收或代收等同认商品无问题！！！12寸，未开封。个人闲置，外盒4成新以上，年代久远盒子一般般，盒控勿入，不刀不换。上海面交优先。非职业卖家，个人收藏，所出售物品不退不换，非诚勿扰", "#复仇者联盟# 神奇四侠电影系列 银影侠 12寸 ～买家先验货后签字，快递员不给先验直接拒收，签收或代收等同认商品无问题！！！12寸，未开封。个人闲置，外盒4成新以上，年代久远盒子一般般，盒控勿入，不刀不换。上海面交优先。非职业卖家，个人收藏，所出售物品不退不换，非诚勿扰"]

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        hideTableViewExtraCellLine(tableView: tableView)
        
        //self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height:0.01))
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: self.tableView.frame.height, width: self.tableView.frame.width, height:100))

        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "itemIdentifier")

        
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
        return profiles.count
    }

    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemIdentifier", for: indexPath) as! ItemTableViewCell

        // Configure the cell...
        cell.profile_photo?.image = UIImage(named: profiles[indexPath.row])
        cell.profile_photo!.layer.cornerRadius = 15
        cell.profile_photo!.layer.masksToBounds = true
        cell.photo1?.image = UIImage(named: photo1[indexPath.row])
        cell.photo2?.image = UIImage(named: photo2[indexPath.row])
        cell.photo3?.image = UIImage(named: photo3[indexPath.row])
        
        cell.name?.text = names[indexPath.row]
        cell.price?.text = price[indexPath.row]
        cell.introduction?.text = intros[indexPath.row]

        return cell
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
