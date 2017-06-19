//
//  Web.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/3.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import UIKit

func LoginGetRequest(command:String){
    let address = serverAdress + "/login?" + command
    //print(address)
    
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            if(data.count == 3){
                Login = true
            }
        }else {
        }
    }
    dataTask.resume()
}

func RegisterGetRequest(command:String){
    let address = serverAdress + "/register?" + command
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            if(data.count == 3){
                Signup = true
            }
        }else {
        }
    }
    dataTask.resume()
}

func sendAMessage(command:String){
    let address = serverAdress + "/send?" + command
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    print(url ?? "no")
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            if(data.count == 3){
            }
        }else {
        }
    }
    dataTask.resume()
}

func receiveMessage(command:String){
    let address = serverAdress + "/message?" + command
    //print(address)
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            //print(data)
            if(data.count > 1){
                let str = String(bytes: data, encoding: String.Encoding.utf8)
                //print(str ?? "default string")
                let values = str?.components(separatedBy: "|")
                var p = 0
                var t = 0
                var r = 0
                for i in 0..<(values![0] as NSString).integerValue{
                    t = 3 * i + 1
                    p = 3 * i + 2
                    r = 3 * i + 3
                    for j in 0..<conversations.count{
                        if(conversations[j].theOtherID == values?[t]){
                            let date = NSDate()
                            let timeFormatter = DateFormatter()
                            timeFormatter.dateFormat = "yyyy MM dd HH mm"
                            let strNowTime = timeFormatter.string(from: date as Date) as String
                            let realMessage = values?[p].removingPercentEncoding
                            conversations[j].addNewMessage(time: strNowTime, message: realMessage!, who: 1)
                            conversations[j].lastSentence = (values?[p])!
                            conversations[j].theOtherName = (values?[r])!
                        }
                    }
                    let appdelegate = UIApplication.shared.delegate as! AppDelegate
                    appdelegate.messageController.reload()
                    appdelegate.conversationController.reload()
                    appdelegate.messageNavigation.updateUnreadMessages()
                }
               // whetherReceive = true
            }
        }else {
        }
    }
    dataTask.resume()
}

func searchAllCommodities(demand:String){
    let address = serverAdress + "/allcommodities?" + demand
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            //print(data)
            if(data.count > 1){
                let str = String(bytes: data, encoding: String.Encoding.utf8)
                let values = str?.components(separatedBy: "|")
                var name = 0
                var label = 0
                var des = 0
                var photo1 = 0
                var photo2 = 0
                var price = 0
                var seller = 0
                for i in 0..<(values![0] as NSString).integerValue{
                    name = 7 * i + 1
                    label = 7 * i + 2
                    des = 7 * i + 3
                    photo1 = 7 * i + 4
                    photo2 = 7 * i + 5
                    price = 7 * i + 6
                    seller = 7 * i + 7
                    let newCommodity = Commodity(name: values![name].removingPercentEncoding!, intro: values![des].removingPercentEncoding!, label: values![label].removingPercentEncoding!, photo1Str: values![photo1], photo2Str: values![photo2], price: values![price], seller:values![seller])
                    commodities.append(newCommodity)
                }
                
                //                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                //                appdelegate.commodityController.tableView.reloadData()
                
//                            print(commodities[0].pic1)
//                                let newData = NSData(base64Encoded: commodities[0].pic1, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
//                                let filePath2 = "/Users/albert/Documents/secret/4.jpg"
//                                newData?.write(toFile: filePath2, atomically: true)
                
            }
        }else {
        }
    }
    dataTask.resume()
}

func searchTypeCommodities(demand:String){
    let address = serverAdress + "/typecommodities?" + demand
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            //print(data)
            
            let category = demand.components(separatedBy: "&")[0].components(separatedBy: "=")[1]
            
            if(data.count > 1){
                
                let str = String(bytes: data, encoding: String.Encoding.utf8)
                let values = str?.components(separatedBy: "|")
                var name = 0
                var des = 0
                var photo1 = 0
                var photo2 = 0
                var price = 0
                var seller = 0
                for i in 0..<(values![0] as NSString).integerValue{
                    name = 6 * i + 1
                    des = 6 * i + 2
                    photo1 = 6 * i + 3
                    photo2 = 6 * i + 4
                    price = 6 * i + 5
                    seller = 6 * i + 6
                    let newCommodity = Commodity(name: values![name].removingPercentEncoding!, intro: values![des].removingPercentEncoding!, label: category, photo1Str: values![photo1], photo2Str: values![photo2], price: values![price], seller:values![seller])
                    commodities.append(newCommodity)
                    print(commodities)
                }
            }
            
            
        }else {
        }
    }
    dataTask.resume()
}

func addNewCommodity(name:String, label:String, intro:String, photo1:String, photo2:String, price:String, seller:String){
    
    let address = serverAdress + "/newcommodity?" + "name=" + name + "&label=" + label + "&intro=" + intro + "&photo1=" + photo1 + "&photo2=" + photo2 + "&price=" + price + "&seller=" + seller
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            if(data.count == 3){
                print("发布成功")
            }
        }else {
            print("发布失败")
        }
    }
    dataTask.resume()
    
    
}

func searchUserInformation(demand:String, myself:Bool){
    let address = serverAdress + "/getuser?" + demand
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            //print(data)
            if(data.count > 1){
                let str = String(bytes: data, encoding: String.Encoding.utf8)
                let values = str?.components(separatedBy: "|")
                
                if(myself){
                    currentUser.name = values![0]
                    currentUser.user_decription = values![1]
                    currentUser.gender = values![2]
                    currentUser.user_gravatar = values![3]
                }
                else{
                    theOtherUser.name = values![0]
                    theOtherUser.user_decription = values![1]
                    theOtherUser.gender = values![2]
//                    theOtherUser.user_gravatar = #imageLiteral(resourceName: "theOtherProfile")
                }
                
            }
        }else {
        }
    }
    dataTask.resume()
    
}

func updateUserInformation(type:String, demand:String){
    var info = "name:" + currentUser.name + "\n" + "description:" + currentUser.user_decription + "\n" + "gender:" + currentUser.gender
    try! info.write(toFile: selfInfoPath + "information.txt", atomically: true, encoding: String.Encoding.utf8)    
    var address = ""
    
    if(type == "name"){
        address = serverAdress + "/updatename?" + demand
    }
    else if(type == "gender"){
        address = serverAdress + "/updategender?" + demand
    }
    else if(type == "description"){
        address = serverAdress + "/updatedescription?" + demand
    }
    
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    print(url ?? "no")
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!){(data, respond, error) in
        if let data = data {
            if(data.count == 3){
            }
        }else {
        }
    }
    dataTask.resume()
}


///*  创建Post请求 */
//func PostRequest()
//{
//    //(1）设置请求路径
//    var url:NSURL =NSURL(string:"http://192.168.1.53:8080/MJServer/login")!//不需要传递参数
//    
//    //(2) 创建请求对象
//    var request:NSMutableURLRequest =NSMutableURLRequest(URL: url) //默认为get请求
//    request.timeoutInterval =5.0 //设置请求超时为5秒
//    request.HTTPMethod ="POST"  //设置请求方法
//    
//    //设置请求体
//    var param:NSString =NSString(format:"username=%@&pwd=%@",self.userName.text!,self.userPwd.text!)
//    //把拼接后的字符串转换为data，设置请求体
//    request.HTTPBody = param.dataUsingEncoding(NSUTF8StringEncoding)
//    
//    //(3) 发送请求
//    NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue()) { (res, data, error)in
//        //服务器返回：请求方式 = POST，返回数据格式 = JSON，用户名 = 123，密码 = 123
//        let  str =NSString(data: data!, encoding:NSUTF8StringEncoding)
//        print(str)
//        
//    }
//}
