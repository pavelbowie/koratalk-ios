//
//  CallsModel.swift
//  HeliosApp+Extension
//
//  Created by Pavel Mac on 14/09/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

struct CallsModel {
    let userName: String
    let userImg: UIImage
    let callType: CallType
    let date: String
}

enum CallType: String {
    case outgoing = "outgoing"
    case incoming = "incoming"
    case missed = "missed"
}