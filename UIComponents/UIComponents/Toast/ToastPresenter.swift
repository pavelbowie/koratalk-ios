//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .appYellow, dark: .appYellow))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        let customView = TostWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
