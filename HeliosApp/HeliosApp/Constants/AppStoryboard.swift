//
//  AppStoryboard.swift
//  HeliosApp+Extension
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    
    case login = "Login"
    case main = "Main"
    case status = "Status"
    case calls = "Calls"
    case camera = "Camera"
    case chats = "Chats"
    case settings = "Settings"
    
    func getRootViewController<T: UIViewController>(_ viewController: T.Type) -> T {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        guard let rootVc = storyboard.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else {
            fatalError(String(describing: viewController) + " Not Found")
        }
        return rootVc
    }
}
