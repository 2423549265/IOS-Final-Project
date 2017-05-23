//
//  MessageTableViewCell.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/18.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var name: UILabel!    
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
