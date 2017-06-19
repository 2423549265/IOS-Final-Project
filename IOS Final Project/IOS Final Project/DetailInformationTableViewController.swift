//
//  DetailInformationTableViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/31.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class DetailInformationTableViewController: UITableViewController {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func hideTableViewExtraCellLine(tableView : UITableView){
        let view = UIView()
        tableView.tableFooterView = view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(currentUser.gender == "1"){
            self.sexLabel.text = "男"
        }
        else{
            self.sexLabel.text = "女"
        }
        self.nameLabel.text = currentUser.name
        self.descriptionLabel.text = currentUser.user_decription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor.init(red: 0.94, green: 0.94, blue: 0.96, alpha: 1)
        hideTableViewExtraCellLine(tableView: tableView)
        
        self.profile.image = UIImage(named: currentUser.user_gravatar)
        
        
//        let nib = UINib(nibName: "DetailInformationTableViewCell", bundle: nil)
//        self.tableView.register(nib, forCellReuseIdentifier: "DetailInformationIdentifier")
      //  hideTableViewExtraCellLine(tableView: tableView)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeName(segue:UIStoryboardSegue){
    }
    
    @IBAction func changeGenderMale(segue:UIStoryboardSegue){
        currentUser.gender = "1"
    }
    
    @IBAction func changeGenderFemale(segue:UIStoryboardSegue){
        currentUser.gender = "0"
    }
    
    @IBAction func changeDescription(segue:UIStoryboardSegue){
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 4
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInformationIdentifier", for: indexPath) as! UITableViewCell
 //       cell.selectionStyle = UITableViewCellSelectionStyle.none
 //       return cell
 //   }
//
//        cell.Content.frame = CGRect(x:270, y: 7, width:70, height: 30)
//        
//        switch indexPath.row {
//        case 0:
//            cell.Name.frame = CGRect(x: 15, y: 17, width: 50, height: 30)
//            cell.Name.text = "头像"
//            cell.Profile.frame = CGRect(x:300 , y: 10, width: 40, height: 40)
//            cell.Profile.image = UIImage(named: currentUser.user_gravatar)
//            cell.Content.text = ""
//            cell.arrow.frame = CGRect(x: 350, y: 25, width: 13, height: 15)
//        case 1:
//            cell.Name.frame = CGRect(x: 15, y: 7, width: 50, height: 30)
//            cell.Name.text = "姓名"
//            cell.Content.text = currentUser.name
//            cell.arrow.frame = CGRect(x: 350, y: 15, width: 13, height: 15)
//        case 2:
//            cell.Name.frame = CGRect(x: 15, y: 7, width: 50, height: 30)
//            cell.Name.text = "性别"
//            if(currentUser.gender == "1"){
//                cell.Content.text = "男"
//            }
//            else{
//                cell.Content.text = "女"
//            }
//            cell.arrow.frame = CGRect(x: 350, y: 15, width: 13, height: 15)
//        case 3:
//            cell.Name.frame = CGRect(x: 15, y: 7, width: 70, height: 30)
//            cell.Name.text = "个性签名"
//            cell.Content.text = currentUser.user_decription
//            cell.arrow.frame = CGRect(x: 350, y: 15, width: 13, height: 15)
//        default: break
//        }
//
//        cell.Content.textColor = UIColor.lightGray
//        // Configure the cell...
//
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        if(indexPath.row == 0){
//            return 60
//        }
//        else{
//            return 40
//        }
//        
//    }


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
