//
//  ShareSheetRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol ShareSheetRoute {
    func presentShareSheet(items: [Any])
}

extension ShareSheetRoute where Self: RouterProtocol {
    
    func presentShareSheet(items: [Any]) {
        let shareSheetController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        let transition = ModalTransition()
        
        open(shareSheetController, transition: transition)
    }
}
