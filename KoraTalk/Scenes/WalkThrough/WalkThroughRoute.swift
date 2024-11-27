//
//  WalkThroughRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

protocol WalkThroughRoute {
    func placeOnWindowOnFreeWalkThrough()
}

extension WalkThroughRoute where Self: RouterProtocol {
    
    func placeOnWindowOnFreeWalkThrough() {
        let router = WalkThroughRouter()
        let viewModel = WalkThroughViewModel(router: router)
        let viewController = WalkThroughViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
