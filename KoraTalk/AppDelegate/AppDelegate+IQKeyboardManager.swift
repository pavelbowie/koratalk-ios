//
//  AppDelegate+IQKeyboardManager.swift
//  KoraTalk
//
//  Created by Pavel Mac on 2/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import IQKeyboardManagerSwift

extension AppDelegate {
    
    func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentListViewController.self)
        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentListViewController.self)
        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentEditViewController.self)
        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentEditViewController.self)
    }
}
