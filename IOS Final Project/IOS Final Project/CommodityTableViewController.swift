//
//  CommodityTableViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/7.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class CommodityTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializeCommodities(searchDemand: "anything")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        hideTableViewExtraCellLine(tableView: tableView)
        
        let nib = UINib(nibName: "CommodityTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "commodityIdentifier")
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.commodityController = self
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commodities.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commodityIdentifier", for: indexPath) as! CommodityTableViewCell
        
        cell.name.text = commodities[indexPath.row].name
        cell.price.text = commodities[indexPath.row].price
        cell.category.text = commodities[indexPath.row].category
        cell.pic.image = UIImage(data: NSData(base64Encoded: commodities[0].pic1, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)! as Data)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        currentCommodity = indexPath.row
        searchUserInformation(demand: "id="+commodities[currentCommodity].seller, myself: false)
        let itemString = commodities[indexPath.row].name
        performSegue(withIdentifier: "ShowDetailCommodity", sender: itemString)
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
