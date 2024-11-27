//
//  HomeRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol HomeRoute {
    func placeOnWindowHome()
}

extension HomeRoute where Self: RouterProtocol {
    func placeOnWindowHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router, dataProvider: APIDataProvider())
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
