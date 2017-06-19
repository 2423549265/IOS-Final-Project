//
//  FoundSeachBar.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class FoundSeachBar: UISearchBar, UISearchBarDelegate {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
     override func draw(_ rect: CGRect) {
        // Drawing code
        self.placeholder = "托福红宝书"
        self.backgroundImage = UIImage()
        self.delegate = self
    
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hello")
    }
    

}
