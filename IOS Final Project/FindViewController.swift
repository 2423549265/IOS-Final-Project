//
//  FindViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/17.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func perform(){
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    @IBAction func loginFailure(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func searchCancel(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func search(_ sender: UIButton) {
        commodities.removeAll()
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    
    @IBAction func searchTextbook(_ sender: UIButton) {
        commodities.removeAll()
        currentCommodityType = "textbook"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    
    @IBAction func searchEnglish(_ sender: UIButton) {
        commodities.removeAll()
        currentCommodityType = "english"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    
    @IBAction func searchComputer(_ sender: UIButton) {
        commodities.removeAll()
        currentCommodityType = "computer"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    
    @IBAction func searchMaster(_ sender: UIButton) {
        commodities.removeAll()
        currentCommodityType = "master"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    @IBAction func searchBusiness(_ sender: Any) {
        commodities.removeAll()
        currentCommodityType = "business"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    @IBAction func searchInterest(_ sender: Any) {
        commodities.removeAll()
        currentCommodityType = "interest"
        let demand = "type=" + currentCommodityType + "&demand=all"
        searchTypeCommodities(demand: demand)
        usleep(700000)
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    @IBAction func addCommodity(_ sender: UIButton) {
        if(!Login){
            performSegue(withIdentifier: "Login", sender: nil)
        }
        else{
            performSegue(withIdentifier: "addcommodity", sender: nil)
        }
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
