//
//  UserView.swift
//  UIComponents
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public class UserView: UIView {
    
    private let userImageView = UIImageViewBuilder()
        .cornerRadius(20)
        .clipsToBounds(true)
        .contentMode(.scaleToFill)
        .build()
    
    private let textStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    
    private let usernameLabel = UILabelBuilder()
        .font(.font(.ttcommonsBold, size: .medium))
        .textColor(.appOrange)
        .build()
    
    private let recipeAndFollowerCountLabel = UILabelBuilder()
        .font(.font(.ttcommonsSemiBold, size: .medium))
        .textColor(.appGrey)
        .build()
    
    private lazy var followButton = ButtonFactory.createPrimaryBorderedButton(style: .small)
    
    public var userImageUrl: String? {
        willSet {
            if let url = newValue {
                userImageView.setImage(url)
            } else {
                userImageView.image = nil
            }
        }
    }
    
    public var recipeAndFollowerCountText: String? {
        willSet {
            recipeAndFollowerCountLabel.text = newValue
        }
    }
    
    public var username: String? {
        willSet {
            usernameLabel.text = newValue
        }
    }
    
    public var isFollowButtonHidden: Bool? {
        willSet {
            followButton.isHidden = newValue ?? false
        }
    }
    
    public enum UserViewType {
        case withFollowButton
        case withoutFollowButton
    }
    
    let userViewType: UserViewType
    
    /// Only use this variable when you enable followButton
    public var isFollowing = false {
        didSet {
            updateFollowButtonState()
        }
    }
    
    public var followButtonTapped: VoidClosure?
    
    public init(userViewType: UserViewType) {
        self.userViewType = userViewType
        super.init(frame: .zero)
        addSubViews()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
}

// MARK: - UILayout
extension UserView {
    
    private func addSubViews() {
        backgroundColor = .appWhite
        addSubview(userImageView)
        userImageView.edgesToSuperview(excluding: .trailing, insets: .init(top: 15, left: 15, bottom: 15, right: 15))
        userImageView.size(.init(width: 40, height: 40))
        
        addSubview(textStackView)
        textStackView.leadingToTrailing(of: userImageView).constant = 10
        textStackView.centerYToSuperview()
        textStackView.addArrangedSubview(usernameLabel)
        textStackView.addArrangedSubview(recipeAndFollowerCountLabel)
        
        switch userViewType {
        case .withFollowButton:
            addSubview(followButton)
            followButton.trailingToSuperview().constant = -15
            followButton.leadingToTrailing(of: textStackView).constant = 10
            followButton.centerYToSuperview()
            followButton.width(120)
            updateFollowButtonState()
        case .withoutFollowButton:
            textStackView.trailingToSuperview().constant = -15
        }
        followButton.addTarget(self, action: #selector(followButtonTapped(_:)), for: .touchUpInside)
    }
}

// MARK: - Configure
extension UserView {
    
    private func updateFollowButtonState() {
        if isFollowing {
            followButton.setTitle(L10n.General.following, for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .appYellow
        } else {
            followButton.setTitle(L10n.General.follow, for: .normal)
            followButton.setTitleColor(.appYellow, for: .normal)
            followButton.backgroundColor = .appWhite
        }
    }
}

// MARK: - Actions
extension UserView {
    
    @objc
    private func followButtonTapped(_ sender: Any?) {
        followButtonTapped?()
    }
}
