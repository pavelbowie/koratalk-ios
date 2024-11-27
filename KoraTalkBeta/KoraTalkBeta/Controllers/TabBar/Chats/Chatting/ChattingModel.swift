//
//  ChattingModel.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 17/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

class ChattingModel: NSObject {
    var message: String
    var messageType: String
    var senderId: String
    var dateAndTime: String
    
    init(message: String, messageType: String, senderId: String, dateAndTime: String) {
        self.message = message
        self.messageType = messageType
        self.senderId = senderId
        self.dateAndTime = dateAndTime
    }
}
