//
//  UnfollowAlertViewRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol UnfollowAlertViewRoute {
    func presentUnfollowAlertView(unFollowAction: VoidClosure?)
}

extension UnfollowAlertViewRoute where Self: RouterProtocol {
    
    func presentUnfollowAlertView(unFollowAction: VoidClosure?) {
        let transition = ModalTransition()
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let unFollowAction = UIAlertAction(title: "Unfollow Alert", style: .destructive) {_ in
            unFollowAction?()
        }
        let dismissAction = UIAlertAction(title: "Warning", style: .cancel, handler: nil)
        
        alert.addAction(unFollowAction)
        alert.addAction(dismissAction)
        
        open(alert, transition: transition)
    }
}
