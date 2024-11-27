//
//  RecipeCell.swift
//  UIComponents
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public class RecipeCell: UICollectionViewCell, ReusableView {
    
    private let userView = UserView(userViewType: .withoutFollowButton)
    
    private let separatorLine = UIViewBuilder()
        .backgroundColor(.appSecondary)
        .build()
    
    private let recipeTitlesContainerView = UIView()
    private let recipeTitleStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.ttcommonsBold, size: .xLarge))
        .textColor(.appOrange)
        .build()
    private let recipeCategoryLabel = UILabelBuilder()
        .font(.font(.ttcommonsSemiBold, size: .xLarge))
        .textColor(.appGrey)
        .build()
    
    private let recipeImageView = UIImageViewBuilder()
        .cornerRadius(4)
        .clipsToBounds(true)
        .contentMode(.scaleAspectFill)
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
    
    private let recipeCommentAndLikeContainerView = UIView()
    private let recipeCommentAndLikeCountLabel = UILabelBuilder()
        .font(.font(.ttcommonsSemiBold, size: .medium))
        .textColor(.appGrey)
        .build()
    
    weak var viewModel: RecipeCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.userView.username = nil
        self.userView.userImageUrl = nil
        self.userView.recipeAndFollowerCountText = nil
        self.recipeTitleLabel.text = nil
        self.recipeCategoryLabel.text = nil
        self.recipeImageView.image = nil
        self.recipeCommentAndLikeCountLabel.text = nil
    }
}

// MARK: - UILayout
extension RecipeCell {
    
    private func addSubViews() {
        backgroundColor = .white
        addUserView()
        addSeperator()
        addRecipeTitlesContainerView()
        addRecipeImageAndappMainLogoImageView()
        addRecipeCommentAndLikeContainerView()
    }
    
    private func addUserView() {
        contentView.addSubview(userView)
        userView.edgesToSuperview(excluding: .bottom)
        userView.height(70)
    }
    
    private func addSeperator() {
        contentView.addSubview(separatorLine)
        separatorLine.topToBottom(of: userView)
        separatorLine.edgesToSuperview(excluding: [.bottom, .top])
        separatorLine.height(1)
    }
    
    private func addRecipeTitlesContainerView() {
        contentView.addSubview(recipeTitlesContainerView)
        recipeTitlesContainerView.topToBottom(of: separatorLine)
        recipeTitlesContainerView.leadingToSuperview().constant = 15
        recipeTitlesContainerView.trailingToSuperview().constant = -15
        recipeTitlesContainerView.height(61)
        
        recipeTitlesContainerView.addSubview(recipeTitleStackView)
        recipeTitleStackView.edgesToSuperview(excluding: [.top, .bottom])
        recipeTitleStackView.centerYToSuperview()
        recipeTitleStackView.addArrangedSubview(recipeTitleLabel)
        recipeTitleStackView.addArrangedSubview(recipeCategoryLabel)
    }
    
    private func addRecipeImageAndappMainLogoImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.topToBottom(of: recipeTitlesContainerView)
        recipeImageView.leadingToSuperview().constant = 15
        recipeImageView.trailingToSuperview().constant = -15
        recipeImageView.aspectRatio(1 / 1)
        
        contentView.addSubview(appMainLogoImageView)
        appMainLogoImageView.top(to: recipeImageView).constant = 15
        appMainLogoImageView.trailing(to: recipeImageView).constant = -15
        appMainLogoImageView.size(.init(width: 40, height: 40))
    }
    
    private func addRecipeCommentAndLikeContainerView() {
        contentView.addSubview(recipeCommentAndLikeContainerView)
        recipeCommentAndLikeContainerView.topToBottom(of: recipeImageView)
        recipeCommentAndLikeContainerView.leadingToSuperview().constant = 15
        recipeCommentAndLikeContainerView.trailingToSuperview().constant = -15
        recipeCommentAndLikeContainerView.height(43)
        recipeCommentAndLikeContainerView.addSubview(recipeCommentAndLikeCountLabel)
        recipeCommentAndLikeCountLabel.centerYToSuperview()
        recipeCommentAndLikeCountLabel.edgesToSuperview(excluding: [.top, .bottom])
    }
}

// MARK: - Set ViewModel
public extension RecipeCell {
    
    func set(viewModel: RecipeCellProtocol) {
        self.viewModel = viewModel
        userView.username = viewModel.username
        userView.recipeAndFollowerCountText = viewModel.userRecipeAndFollowerCountText
        userView.userImageUrl = viewModel.userImageUrl
        recipeTitleLabel.text = viewModel.recipeTitle
        recipeCategoryLabel.text = viewModel.categoryName
        recipeCommentAndLikeCountLabel.text = viewModel.recipeCommentAndLikeCountText
        recipeImageView.setImage(viewModel.recipeImageUrl)
        appMainLogoImageView.isHidden = !viewModel.isEditorChoice
    }
}
