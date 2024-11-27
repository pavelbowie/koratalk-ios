//
//  ScreenSize.swift
//  KoraTalk
//
//  Created by Pavel Mac on 16/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

enum ScreenSize {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}
