//
//  CommodityViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/13.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class CommodityViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var commodityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        //  searchBar.showsCancelButton = true
        
        /* let childViewController = CommodityTableViewController.init()
         childViewController.view.frame = CGRect(x: 0, y: 64, width: 375, height: 560)
         self.addChildViewController(childViewController)
         self.view.addSubview(childViewController.view)*/
        
        self.commodityTableView.delegate = self
        self.commodityTableView.dataSource = self
        
        let nib = UINib(nibName: "CommodityTableViewCell", bundle: nil)
        self.commodityTableView.register(nib, forCellReuseIdentifier: "commodityIdentifier")
        
        let view = UIView()
        commodityTableView.tableFooterView = view
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchAllCommodities(demand: "demand=" + searchBar.text!)
        usleep(700000)
        //(self.childViewControllers.first as! CommodityTableViewController).tableView.reloadData()
        commodityTableView.reloadData()
        searchBar.endEditing(true)
        // performSegue(withIdentifier: "ShowDetailCommodity", sender: nil)
    }
    
    func performDetail(){
        print("jinlaileaaaaaaaaaaaaaaaaaaaaaaaa")
        performSegue(withIdentifier: "ShowDetailCommodity", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // print(commodities.count)
        return commodities.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commodityIdentifier", for: indexPath) as! CommodityTableViewCell
        
        cell.name.text = commodities[indexPath.row].name
        cell.price.text = commodities[indexPath.row].price
        cell.category.text = commodities[indexPath.row].category
        cell.pic.image = #imageLiteral(resourceName: "书2")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentCommodity = indexPath.row
        searchUserInformation(demand: "id="+commodities[currentCommodity].seller, myself: false)
        theOtherUser.user_id=commodities[currentCommodity].seller
        //let itemString = commodities[indexPath.row].name
        usleep(700000)
        performSegue(withIdentifier: "ShowDetailCommodity", sender: nil)
    }
    
    @IBAction func backFromDetail(segue: UIStoryboardSegue){
        
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
