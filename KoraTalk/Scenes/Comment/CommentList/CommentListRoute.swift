//
//  CommentListRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 30/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol CommentListRoute {
    func pushCommentList(recipeId: Int, isKeyboardOpen: Bool?)
}

extension CommentListRoute where Self: RouterProtocol {
    
    func pushCommentList(recipeId: Int, isKeyboardOpen: Bool?) {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(recipeId: recipeId, router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        viewController.isKeyboardOpen = isKeyboardOpen ?? false
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
