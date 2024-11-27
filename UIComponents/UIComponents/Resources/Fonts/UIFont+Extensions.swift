//
//  UIFont+Extensions.swift
//  UIComponents
//
//  Created by Pavel Mac on 5/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public extension UIFont {
    
    enum FontWeight {
        case ttcommonsSemiBold
        case ttcommonsBold
        case ttcommonsExtraBold
    }
    
    enum FontSize {
        case xSmall  // 11
        case small   // 12
        case medium  // 13
        case large   // 14
        case xLarge  // 15
        case xxLarge // 16
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .xSmall:           return 11
            case .small:            return 12
            case .medium:           return 13
            case .large:            return 14
            case .xLarge:           return 15
            case .xxLarge:          return 16
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .ttcommonsSemiBold:
            font = FontFamily.TTCommons.bold.font(size: size.rawValue)
        case .ttcommonsBold:
            font = FontFamily.TTCommons.bold.font(size: size.rawValue)
        case .ttcommonsExtraBold:
            font = FontFamily.TTCommons.extraBold.font(size: size.rawValue)
        }
        return font
    }
}
