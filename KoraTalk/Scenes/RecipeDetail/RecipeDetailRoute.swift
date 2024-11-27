//
//  RecipeDetailRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 8/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol RecipeDetailRoute {
    func pushRecipeDetail(recipeId: Int)
}

extension RecipeDetailRoute where Self: RouterProtocol {
    func pushRecipeDetail(recipeId: Int) {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(recipeId: recipeId, router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.openTransition = transition
        router.viewController = viewController
        open(viewController, transition: transition)
    }
}
