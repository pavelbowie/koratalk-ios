//
//  UIImage+Extensions.swift
//  UIComponents
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Kingfisher

public extension UIImage {
    
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
}
