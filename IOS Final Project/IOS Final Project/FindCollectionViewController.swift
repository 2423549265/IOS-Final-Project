//
//  FindCollectionViewController.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/26.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
let find_addr = "/Users/albert/Documents/大学课程/大三下/移动互联/图片"

class FindCollectionViewController: UICollectionViewController{
    
    @IBAction func search(_ sender: UIButton) {
        performSegue(withIdentifier: "Commodity", sender: nil)
    }
    
    
    var names = ["课本","英语","计算机","考研/公务员","CFA/ACCA","兴趣读物"]
    var infos = ["各院系各年级读物教材", "四六级、托福 GRE GMAT", "计算机等级考试辅导书", "考研、考公务员辅导资料", "金融、会计证书辅导资料", "小说、漫画、散文集..."]
    
    var image_addrs = [find_addr + "/1.jpg", find_addr + "/2.jpg", find_addr + "/3.jpg", find_addr + "/4.jpg", find_addr + "/5.jpg", find_addr + "/6.jpg"]

    @IBAction func addCommodity(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        

        // Register cell classes
        let nib = UINib(nibName: "FindCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
      
        
        self.collectionView!.register(UINib(nibName: "FindCollectionReuableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ConversationViewController.viewTap(sender:)))
        self.view.addGestureRecognizer(gesture)
        
                // Do any additional setup after loading the view.
    }

    func viewTap(sender:UITapGestureRecognizer){
        // print("b")
        self.view.endEditing(true)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return names.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FindCollectionViewCell
        
        cell.name?.text = names[indexPath.row]
        cell.info?.text = infos[indexPath.row]
        cell.image?.image = UIImage(named: image_addrs[indexPath.row])
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FindCollectionViewHeader", for: indexPath)
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.item)
        switch(indexPath.item){
            case 1: currentCommodityType = "textbook"
            case 2: currentCommodityType = "english"
            case 3: currentCommodityType = "computer"
            case 4: currentCommodityType = "master"
            case 5: currentCommodityType = "business"
            case 6: currentCommodityType = "interest"
            default: print("something wrong!")
        }
        
        let demand = "type=" + currentCommodityType + "demand=all"
        searchTypeCommodities(demand: demand)
        
        performSegue(withIdentifier: "Commodity", sender: "main")
        
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
