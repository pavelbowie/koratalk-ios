//
//  LoginRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol LoginRoute {
    func presentLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func presentLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = TransparentNavigationController(rootViewController: viewController)
        let transition = ModalTransition(isAnimated: true, modalTransitionStyle: .coverVertical, modalPresentationStyle: .fullScreen)
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
