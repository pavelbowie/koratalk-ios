//
//  AppRouter.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import UIKit
import SKPhotoBrowser
import MobilliumUserDefaults

final class AppMainRouter: Router, AppMainRouter.Routes {
    
    typealias Routes = MainTabBarRoute & WalkThroughRoute & PhotoBrowserRoute
    
    static let shared = AppMainRouter()
    
    func startApp() {
        if DefaultsKey.isWalkThroughCompleted.value == true {
            placeOnWindowInMainTabBar()
        } else {
            placeOnWindowOnFreeWalkThrough()
        }
    }
    
    func presentPhotoBrowser(with photos: [String], delegate: PhotoBrowserDelegate, initialPageIndex: Int = 0) {
        guard let topVC = topViewController() else {
            return
        }
        presentPhotoBrowser(with: photos, viewController: topVC, initialPageIndex: initialPageIndex, delegate: delegate)
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var detectTopController = keyWindow?.rootViewController {
            while let presentedViewController = detectTopController.presentedViewController {
                detectTopController = presentedViewController
            }
            return detectTopController
        }
        return nil
    }
}
