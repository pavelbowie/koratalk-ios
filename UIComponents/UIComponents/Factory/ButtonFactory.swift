//
//  ButtonFactory.swift
//  UIComponents
//
//  Created by Pavel Mac on 22/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public class ButtonFactory {
    
    public enum Style {
        case large
        case medium
        case small
        
        var height: CGFloat {
            switch self {
            case .large: return 60
            case .medium: return 50
            case .small: return 40
            }
        }
        
        var fontSize: UIFont.FontSize {
            switch self {
            case .large: return .xLarge
            case .medium: return .medium
            case .small: return .medium
            }
        }
    }
    
    public static func createPrimaryButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.ttcommonsBold, size: style.fontSize))
            .titleColor(.appWhite)
            .backgroundColor(.appYellow)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
    
    public static func createPrimaryBorderedButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.ttcommonsBold, size: style.fontSize))
            .titleColor(.appYellow)
            .backgroundColor(.appWhite)
            .cornerRadius(4)
            .borderWidth(2)
            .borderColor(UIColor.appYellow.cgColor)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
}
