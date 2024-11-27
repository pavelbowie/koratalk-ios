//
//  MainNavigationController.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents() {
        let backImage = UIImage.icBack
            .resize(to: .init(width: 11, height: 18))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0))
        let titleTextAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.ttcommonsExtraBold, size: .medium))
            .foregroundColor(.appWhite)
            .build()
        
        navigationBar.barTintColor = .appYellow
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .appWhite
        navigationBar.titleTextAttributes = titleTextAttributes
        UIBarButtonItem.appearance().setTitleTextAttributes(AttributedStringDictionaryBuilder()
                                                                .font(.font(.ttcommonsSemiBold, size: .large))
                                                                .foregroundColor(.appWhite)
                                                                .build(),
                                                            for: .normal)

        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .appYellow
            appearance.titleTextAttributes = titleTextAttributes
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
