//
//  UIView.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 20/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
    }
}
