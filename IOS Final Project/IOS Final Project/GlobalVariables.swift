//
//  GlocalVariables.swift
//  IOS Final Project
//
//  Created by Albert on 2017/6/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation

// 服务器地址
let serverAdress = "http://123.206.201.60:8888"
//let serverAdress = "http://127.0.0.1:8888"

// 文件地址
var userDocumentPath = ""
var selfInfoPath = ""
var conversationPath = ""
var selfPath = ""

// 对话
var currentConversation = 0
var conversations = [Conversation]()
var initialConversation = Conversation()
var hasInitialConversation = false

// 商品
var currentCommodity = 0
var commodities = [Commodity]()

// 判断当前是否收到新消息
var whetherReceive = false

// 当前用户
var Login = false
var Signup = false
var userID = ""
var currentUser = User(name: "", userDescription: "" ,gender: "")
var theOtherUser = User(name:"", userDescription: "", gender: "")
//当前展示的type类型
var currentCommodityType = "all"

// 高度
var totalConversationHeight = 0.0
var ConversationCellHeight = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

// 本地有的用户
var localUserList = [String]()

var totalUnReadMessagesNum = 0

var search = false


