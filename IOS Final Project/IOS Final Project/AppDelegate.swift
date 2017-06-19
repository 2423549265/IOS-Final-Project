//
//  AppDelegate.swift
//  IOS Final Project
//
//  Created by Albert on 2017/5/13.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var messageController = MessageTableViewController()
    var messageNavigation = MessageNavigationController()
    var conversationController = ConversationTableViewController()
    var commodityController = CommodityTableViewController()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound],
                                                  categories: nil)
        application.registerUserNotificationSettings(settings)
        
        Thread.detachNewThreadSelector(#selector(self.updateConversation),
                                       toTarget: self, with: nil)
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        self.messageController = mainSB.instantiateViewController(withIdentifier: "messagetable") as! MessageTableViewController
        self.conversationController = mainSB.instantiateViewController(withIdentifier: "conversationtable") as! ConversationTableViewController        
        self.messageNavigation = mainSB.instantiateViewController(withIdentifier: "messagenavigation") as! MessageNavigationController
        self.commodityController = mainSB.instantiateViewController(withIdentifier: "commoditytable") as! CommodityTableViewController
        
       // let home = NSHomeDirectory() as NSString;
     //   print(home)
      //  let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
      //  print(DocumentPath)
        let isFileManager = FileManager.default
        let isFilePath:String = NSHomeDirectory() + "/Documents/Users/"
        //let isFilePath:String = "/Users/albert/Documents/NJUXY/Users/"
        
        try! isFileManager.removeItem(atPath: isFilePath)
        
        if(isFileManager.fileExists(atPath: isFilePath) == false){
            try! isFileManager.createDirectory(atPath: isFilePath,
                                                   withIntermediateDirectories: true, attributes: nil)
        }
        
        
       // print(isFileManager.fileExists(atPath: isFilePath))
        
        userDocumentPath = isFilePath
        
        let fileManager = FileManager.default
        do{
            try localUserList = fileManager.contentsOfDirectory(atPath: userDocumentPath)
        }catch{
            
        }
        
        for i in 0..<localUserList.count{
            if(localUserList[i] == ".DS_Store"){
                localUserList.remove(at: i)
                break
            }
        }
        
//        let pic1 = "/Users/albert/Documents/1.jpg"
//        let pic2 = "/Users/albert/Documents/2.jpg"
//        let data1 = NSData(contentsOfFile: pic1)
//        let data2 = NSData(contentsOfFile: pic2)
//        
//        var str1 = data1!.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithCarriageReturn)
//        var str2 = data2!.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithCarriageReturn)
//        
//        addNewCommodity(name: "IOS基础", label: "textbook", intro: "曹春", photo1: "", photo2: "", price: "46.6", seller: "131160039")
        return true
    }
    
    func updateConversation(){
        while(true){
            if(Login){
                let commandLine = "username=" + userID
                receiveMessage(command: commandLine)
            }
            sleep(1)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

