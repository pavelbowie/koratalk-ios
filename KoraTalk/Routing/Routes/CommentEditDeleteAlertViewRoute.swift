//
//  CommentEditDeleteAlertViewRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 5/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol CommentEditDeleteAlertViewRoute {
    func presentCommentEditDeleteAlertView(edit: VoidClosure?, delete: VoidClosure?)
}

extension CommentEditDeleteAlertViewRoute where Self: RouterProtocol {
    
    func presentCommentEditDeleteAlertView(edit: VoidClosure?, delete: VoidClosure?) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let edit = UIAlertAction(title: "Düzenle", style: .default) { _ in
            edit?()
        }
        let delete = UIAlertAction(title: "Sil", style: .destructive) { _ in
            delete?()
        }
        let dismiss = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        let transition = ModalTransition()
        
        alert.addAction(edit)
        alert.addAction(delete)
        alert.addAction(dismiss)
        
        open(alert, transition: transition)
    }
}
