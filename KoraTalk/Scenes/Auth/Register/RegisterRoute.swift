//
//  RegisterRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol RegisterRoute {
    func pushRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func pushRegister() {
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController(viewModel: viewModel)
        let transition = PushTransition()
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
