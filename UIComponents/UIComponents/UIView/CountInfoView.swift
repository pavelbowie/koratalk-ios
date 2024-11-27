//
//  CountInfoView.swift
//  UIComponents
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public class CountInfoView: UIView {
    
    private let iconButton = UIButtonBuilder()
        .tintColor(.appOrange)
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let countLabel = UILabelBuilder()
        .font(.font(.ttcommonsSemiBold, size: .medium))
        .textColor(.appYellow)
        .textAlignment(.center)
        .build()
    
    private let infoLabel = UILabelBuilder()
        .font(.font(.ttcommonsSemiBold, size: .medium))
        .textColor(.appGrey)
        .textAlignment(.center)
        .build()
    
    public var isSelected = false {
        willSet {
            iconButton.tintColor = newValue ? .appYellow : .appOrange
        }
    }
    
    public var icon: UIImage? {
        willSet {
            iconButton.setImage(newValue?.resize(to: .init(width: 20, height: 18), for: .scaleAspectFit), for: .normal)
        }
    }
    
    public var iconColor: UIColor? {
        willSet {
            iconButton.tintColor = newValue
        }
    }
    
    public var count: Int? {
        willSet {
            countLabel.text = newValue?.toString
        }
    }
    
    public var info: String? {
        willSet {
            infoLabel.text = newValue
        }
    }
    
    public var iconButtonTapped: VoidClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        backgroundColor = .appWhite
        addSubview(iconButton)
        iconButton.centerXToSuperview()
        iconButton.leadingToSuperview(relation: .equalOrGreater)
        iconButton.trailingToSuperview(relation: .equalOrLess)
        iconButton.topToSuperview().constant = 15
        iconButton.size(.init(width: 20, height: 18))
        iconButton.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        
        addSubview(stackView)
        stackView.topToBottom(of: iconButton).constant = 7
        stackView.centerXToSuperview()
        stackView.leadingToSuperview(relation: .equalOrGreater)
        stackView.trailingToSuperview(relation: .equalOrLess)
        stackView.bottomToSuperview().constant = -10
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(infoLabel)
    }
}

extension CountInfoView {
    
    @IBAction private func iconButtonTapped(_ sender: Any?) {
        iconButtonTapped?()
    }
}
