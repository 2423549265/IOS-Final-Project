//
//  ConversationTableViewCell.swift
//  IOS Final Project
//
//  Created by Apple on 17/5/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var profile: UIImageView!
    
    @IBOutlet weak var message: UIButton!
    
    @IBOutlet weak var myProfile: UIImageView!
    @IBOutlet weak var myMessage: UIButton!
    @IBOutlet weak var messageButton: UIImageView!
    @IBOutlet weak var myMessageArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//249 217 96
