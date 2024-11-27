//
//  RecipesRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 15/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol RecipesRoute {
    func pushRecipes(categoryId: Int, title: String)
}

extension RecipesRoute where Self: RouterProtocol {
    
    func pushRecipes(categoryId: Int, title: String) {
        let router = RecipesRouter()
        let viewModel = RecipesViewModel(recipesListingType: .categoryRecipes(categoryId: categoryId), router: router)
        viewModel.title = title
        let viewController = RecipesViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.openTransition = transition
        router.viewController = viewController
        open(viewController, transition: transition)
    }
}
