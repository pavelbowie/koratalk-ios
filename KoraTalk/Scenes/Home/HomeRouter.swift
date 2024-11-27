//
//  HomeRouter.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

final class HomeRouter: Router, HomeRouter.Routes {
    typealias Routes = RecipesRoute & RecipeDetailRoute
}
