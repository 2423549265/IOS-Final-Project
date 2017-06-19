//
//  Commodity.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/7.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation

enum CommodityCategory : String {
    case textbook = "课本"
    case english = "英语"
    case computer = "计算机"
    case master = "研／国"
    case business = "商科"
    case interest = "兴趣"
}


class Commodity{
    public var name:String = ""
    public var introduction = ""
    public var price = ""
    public var pic1 = ""
    public var pic2 = ""
    public var category = CommodityCategory.textbook.rawValue
    public var seller = ""
    
    init(name:String, intro:String, label:String, photo1Str:String, photo2Str:String, price:String, seller:String){
        self.name = name
        self.introduction = intro
        self.pic1 = photo1Str
        self.pic2 = photo2Str
        self.price = price
        self.seller = seller
        
        switch(label){
        case "textbook": self.category = CommodityCategory.textbook.rawValue
        case "english": self.category = CommodityCategory.english.rawValue
        case "computer": self.category = CommodityCategory.computer.rawValue
        case "master": self.category = CommodityCategory.master.rawValue
        case "business": self.category = CommodityCategory.business.rawValue
        case "interest": self.category = CommodityCategory.interest.rawValue
        default: print("error")
        }
        
    }
}
