//
//  MainTabBarController.swift
//  KoraTalk
//
//  Created by Pavel Mac on 2/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .appRed
    
        let homeViewController = createHomeViewController()
        let favoritesViewController = createFavoritesViewController()
        let favoritesViewController1 = createFavoritesViewController1()
        let profileViewController = createProfileViewController()
        
        viewControllers = [
            homeViewController,
            favoritesViewController,
            favoritesViewController1,
            profileViewController
        ]
    }
    
    private func createHomeViewController() -> UINavigationController {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navController = MainNavigationController(rootViewController: homeViewController)
        navController.tabBarItem.image = .icHome
        homeRouter.viewController = homeViewController
        return navController
    }
    
    private func createFavoritesViewController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navController = MainNavigationController(rootViewController: favoritesViewController)
        navController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navController
    }
    
    private func createFavoritesViewController1() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navController = MainNavigationController(rootViewController: favoritesViewController)
        navController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navController
    }
    
    private func createProfileViewController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navController = MainNavigationController(rootViewController: favoritesViewController)
        navController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navController
    }
}
