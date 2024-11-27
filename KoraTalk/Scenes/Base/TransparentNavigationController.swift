//
//  TransparentNavigationController.swift
//  KoraTalk
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        makeTransparentBackground()
    }
    
    private func configureContents() {
        let backImage = UIImage.icBack
            .resize(to: .init(width: 11, height: 18))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0))
        let titleTextAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.ttcommonsExtraBold, size: .medium))
            .foregroundColor(.appOrange)
            .build()
        navigationBar.barTintColor = .clear
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .appOrange
        navigationBar.titleTextAttributes = titleTextAttributes
        UIBarButtonItem.appearance().setTitleTextAttributes(AttributedStringDictionaryBuilder()
                                                                .font(.font(.ttcommonsSemiBold, size: .large))
                                                                .foregroundColor(.appOrange)
                                                                .build(),
                                                            for: .normal)

        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .clear
            appearance.titleTextAttributes = titleTextAttributes
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
    
    private func makeTransparentBackground() {
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
