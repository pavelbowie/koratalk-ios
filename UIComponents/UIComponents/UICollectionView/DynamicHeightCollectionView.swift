//
//  DynamicHeightCollectionView.swift
//  UIComponents
//
//  Created by Pavel Mac on 15/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public class DynamicHeightCollectionView: UICollectionView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
