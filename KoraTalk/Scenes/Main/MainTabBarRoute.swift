//
//  MainTabBarRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol MainTabBarRoute {
    func placeOnWindowInMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowInMainTabBar() {
        let mainTabBarController = MainTabBarController()
        let transition = PlaceOnWindowTransition()
        
        open(mainTabBarController, transition: transition)
    }
}
