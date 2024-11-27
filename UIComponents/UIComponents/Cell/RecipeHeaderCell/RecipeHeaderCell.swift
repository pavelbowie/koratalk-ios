//
//  RecipeHeaderCell.swift
//  UIComponents
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public class RecipeHeaderCell: UICollectionViewCell, ReusableView {
    
    private let headerImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    
    private let appMainLogoImageView = UIImageViewBuilder()
        .contentMode(.center)
        .image(UIImage.appMainLogo.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowColor(UIColor.appOrange.cgColor)
        .shadowOpacity(0.40)
        .shadowOffset(.zero)
        .shadowRadius(4)
        .backgroundColor(.appWhite)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayout
extension RecipeHeaderCell {
    
    private func addSubViews() {
        contentView.addSubview(headerImageView)
        headerImageView.edgesToSuperview()
        
        contentView.addSubview(appMainLogoImageView)
        appMainLogoImageView.top(to: headerImageView).constant = 15
        appMainLogoImageView.trailing(to: headerImageView).constant = -15
        appMainLogoImageView.size(.init(width: 40, height: 40))
    }
}

// MARK: - Set ViewModel
public extension RecipeHeaderCell {
    func set(with viewModel: RecipeHeaderCellProtocol) {
        headerImageView.setImage(viewModel.imageUrl)
        appMainLogoImageView.isHidden = !viewModel.isEditorChoice
    }
}
