//
//  PasswordResetRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 30/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol PasswordResetRoute {
    func pushPasswordReset()
}

extension PasswordResetRoute where Self: RouterProtocol {
    
    func pushPasswordReset() {
        let router = PasswordResetRouter()
        let viewModel = PasswordResetViewModel(router: router)
        let viewController = PasswordResetViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
