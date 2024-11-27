//
//  EmptyCell.swift
//  UIComponents
//
//  Created by Pavel Mac on 4/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public class EmptyCell: UICollectionViewCell, ReusableView {
    
    private let infoLabel = UILabelBuilder()
        .textAlignment(.center)
        .numberOfLines(0)
        .font(.font(.ttcommonsSemiBold, size: .xLarge))
        .textColor(.appGrey)
        .build()
    
    public var infoText: String? {
        willSet {
            infoLabel.text = newValue
        }
    }
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    weak var viewModel: EmptyCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

// MARK: - UILayout
extension EmptyCell {
    
    private func addSubViews() {
        contentView.backgroundColor = .appWhite
        contentView.addSubview(infoLabel)
        infoLabel.edgesToSuperview(insets: UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20))
    }
}

// MARK: - Set ViewModel
public extension EmptyCell {
    
    func set(viewModel: EmptyCellProtocol) {
        self.viewModel = viewModel
    }
}
