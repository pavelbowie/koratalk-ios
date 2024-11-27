//
//  ActiveChatsModel.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 17/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

class ActiveChatsModel: NSObject {
    var userName: String
    var userImage: String
    var userEmail: String
    var userAbout: String
    var userLatitude: String
    var userLongitude: String
    var userGender: String
    var userStatus: String
    var userLastMsg: String
    var msgDateAndTime: String
    var chatChannelId: String
    
    init(userName: String, userImage: String, userEmail: String, userAbout: String, userLatitude: String, userLongitude: String, userGender: String, userStatus: String, userLastMsg: String, msgDateAndTime: String, chatChannelId: String) {
        self.userName = userName
        self.userImage = userImage
        self.userEmail = userEmail
        self.userAbout = userAbout
        self.userLatitude = userLatitude
        self.userLongitude = userLongitude
        self.userGender = userGender
        self.userStatus = userStatus
        self.userLastMsg = userLastMsg
        self.msgDateAndTime = msgDateAndTime
        self.chatChannelId = chatChannelId
    }
}
