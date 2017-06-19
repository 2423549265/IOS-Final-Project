//
//  CommodityTableViewCell.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/7.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class CommodityTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var history: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
