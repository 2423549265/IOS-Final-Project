//
//  User.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/9.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import UIKit

func initializeUser(userID:String){
    if(!localUserList.contains(userID)){
        searchUserInformation(demand:"userID=" + userID, myself:true)
        usleep(700000)
        let fileManager = FileManager.default
        try! fileManager.createDirectory(atPath: selfInfoPath, withIntermediateDirectories: true, attributes: nil)
        try! fileManager.createDirectory(atPath: conversationPath + "110_系统/", withIntermediateDirectories: true, attributes: nil)
        fileManager.createFile(atPath: selfInfoPath + "information.txt", contents: nil, attributes: nil)

        var info = "name:" + currentUser.name + "\n" + "description:" + currentUser.user_decription + "\n" + "gender:" + currentUser.gender
        try! info.write(toFile: selfInfoPath + "information.txt", atomically: true, encoding: String.Encoding.utf8)
        var newData = NSData(data:UIImageJPEGRepresentation(#imageLiteral(resourceName: "系统头像"), 0.0)!)
        var filePath2 = selfInfoPath + "1.jpg"
        newData.write(toFile: filePath2, atomically: true)
        
        info = "re我是系统，你可以随意给我发任何消息，我会回给你一样的。2017 01 01 00 00\n" + "re我是系统，我在测试长句子，啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊。2017 02 01 00 00\n" + "re如果时间是今天，会显示小时：分钟，否则会显示日期。2017 06 20 01 00\n" + "re你可以通过与系统对话测试视图的平移和服务器的性能。2017 06 20 01 59\n" + "re祝您使用愉快。2017 06 20 02 58"
        try! info.write(toFile: conversationPath + "110_系统/110.txt", atomically: true, encoding: String.Encoding.utf8)
        newData = NSData(data:UIImageJPEGRepresentation(#imageLiteral(resourceName: "系统头像"), 0.0)!)
        filePath2 = conversationPath + "110_系统/2.jpg"
        newData.write(toFile: filePath2, atomically: true)

    }
    else{
        let path = selfInfoPath + "information.txt"
        let url = NSURL(fileURLWithPath: path)
        var data = ""
        
        do{
            data = try NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue) as String
            //print(data)
        }catch let error as NSError{
            print("\(error.localizedDescription)")
        }
        
        let sentences = data.components(separatedBy: "\n")
        currentUser.name = sentences[0].components(separatedBy: ":")[1]
        currentUser.user_decription = sentences[1].components(separatedBy: ":")[1]
        currentUser.gender = sentences[2].components(separatedBy: ":")[1]
    }

}

class User{
    var user_id = ""
    var user_gravatar = selfInfoPath + "/1.jpg"
    var user_decription = ""
    var name = ""
    var gender = ""
    var soldout_list = [Commodity]()
    var selling_list = [Commodity]()
    var like_list = [Commodity]()
    
    init(name:String, userDescription:String, gender:String){
        self.user_id = userID
        self.name = name
        self.user_decription = userDescription
        self.gender = gender
    }
    
}
