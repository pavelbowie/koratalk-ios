//
//  UILabel+Ext.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttributedTextWithClickablePart(fullText: String, clickablePart: String, clickablePartColor: UIColor = .systemGreen, clickablePartFont: UIFont = .boldSystemFont(ofSize: 14), defaultFont: UIFont = .systemFont(ofSize: 14), action: Selector, target: Any) {
        
        let attributedText = NSMutableAttributedString(string: fullText)
        
        attributedText.addAttribute(.font, value: defaultFont, range: NSRange(location: 0, length: fullText.count))
        
        let clickableRange = (fullText as NSString).range(of: clickablePart)
        
        attributedText.addAttribute(.font, value: clickablePartFont, range: clickableRange)
        attributedText.addAttribute(.foregroundColor, value: clickablePartColor, range: clickableRange)
        
        self.attributedText = attributedText
        
        self.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
    }
    
    func didTapAttributedTextInRange(_ range: NSRange, gesture: UITapGestureRecognizer) -> Bool {
        guard let attributedText = self.attributedText else { return false }
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let locationOfTouchInLabel = gesture.location(in: self)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (self.bounds.size.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (self.bounds.size.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y)
        
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, range)
    }
}
