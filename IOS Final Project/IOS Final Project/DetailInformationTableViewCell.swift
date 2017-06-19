//
//  DetailInformationTableViewCell.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/31.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class DetailInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Content: UILabel!
    
    @IBOutlet weak var Profile: UIImageView!
    
    @IBOutlet weak var arrow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
