//
//  Conversation.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import UIKit

func initializeConversations(userID:String){
    let fileManager = FileManager.default
    var files = [String]()
    do{
        try files = fileManager.contentsOfDirectory(atPath: conversationPath)
    }catch{
        
    }
    
    for i in 0..<files.count{
        if(files[i] == ".DS_Store"){
            files.remove(at: i)
            break
        }
    }
    
    print(files)
    for i in 0..<files.count{
        let newConversation = Conversation()
        newConversation.initialize(selfID: userID, theOtherID_Name: files[i])
        conversations.append(newConversation)
    }
    
    
}

class Conversation{
    public var selfID:String = ""
    public var theOtherID:String = ""
    public var messages:[String] = []
    public var whos:[Int] = []
    public var times:[String] = []
    public var images:[String] = []
    public var unReadMessagesNum:Int = 0
    public var lastSentence = ""
    public var selfPhoto = ""
    public var theOtherPhoto = ""
    public var theOtherName = ""
    
    
    
    //private let userDocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory , .userDomainMask, true)[0]
    
    public func initialize(selfID:String, theOtherID_Name:String){
        self.selfID = selfID
        self.theOtherID = theOtherID_Name.components(separatedBy: "_")[0]
        self.theOtherName = theOtherID_Name.components(separatedBy: "_")[1]
        self.selfPhoto = selfInfoPath + "/1.jpg"
        self.theOtherPhoto = conversationPath + theOtherID_Name + "/2.jpg"
        let path = conversationPath + theOtherID_Name + "/" + self.theOtherID + ".txt"
        
        let isFileManager = FileManager.default
        if(!isFileManager.fileExists(atPath: path)){
            try! isFileManager.createDirectory(atPath: conversationPath + theOtherID_Name + "/",
                                              withIntermediateDirectories: true, attributes: nil)
           
            isFileManager.createFile(atPath: path, contents: nil, attributes: nil)
            let date = NSDate()
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "yyyy MM dd HH mm"
            let strNowTime = timeFormatter.string(from: date as Date) as String
            let info = "请问您想买我的书吗？" + strNowTime
            try! info.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            let newData = NSData(data:UIImageJPEGRepresentation(#imageLiteral(resourceName: "theOtherProfile"), 0.0)!)
            let filePath2 = conversationPath + theOtherID_Name + "/2.jpg"
            newData.write(toFile: filePath2, atomically: true)
        }
        
        let url = NSURL(fileURLWithPath: path)
        var data = ""
        
        do{
            data = try NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue) as String
            //print(data)
        }catch let error as NSError{
            print("\(error.localizedDescription)")
        }
        
        let sentences = data.components(separatedBy: "\n")
        if(sentences[0] == ""){
            return
        }
        for sentence in sentences{
            let preIndex = sentence.index(sentence.startIndex, offsetBy: 2)
            let sufIndex = sentence.index(sentence.endIndex, offsetBy: -16)
            
            let person = sentence.substring(to: preIndex)
            let time = sentence.substring(from: sufIndex)
            let message = sentence.substring(with: Range<String.Index>.init(uncheckedBounds: (lower: preIndex, upper: sufIndex)))
            
            times.append(time)
            messages.append(message)
            self.lastSentence = message
            
            if(person == "se"){
                whos.append(2)
                images.append(self.selfPhoto)
            }
            else{
                whos.append(1)
                images.append(self.theOtherPhoto)
            }
            
        }
        
    }
    
    public func addNewMessage(time:String, message:String, who:Int){
        times.append(time)
        messages.append(message)
        whos.append(who)
        if(who == 1){
            unReadMessagesNum += 1
            totalUnReadMessagesNum += 1
            images.append(self.theOtherPhoto)

        }
        else{
            images.append(self.selfPhoto)

        }
    }
    
}
