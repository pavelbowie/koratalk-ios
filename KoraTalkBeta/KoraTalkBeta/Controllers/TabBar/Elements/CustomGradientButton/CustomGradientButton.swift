//
//  CustomGradientButton.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CustomGradientButton: UIButton {

    @IBInspectable var startColor: UIColor = .black {
        didSet {
            updateGradient()
        }
    }

    @IBInspectable var endColor: UIColor = .blue {
        didSet {
            updateGradient()
        }
    }
    
    private var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }

    private func updateGradient() {
        gradientLayer?.removeFromSuperlayer()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        self.gradientLayer = gradientLayer
        self.gradientLayer?.cornerRadius = 16
    }
}
