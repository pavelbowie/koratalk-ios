//
//  PageControl.swift
//  UIComponents
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public class PageControl: UIPageControl {
    
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
        tintColor = .appYellow
        pageIndicatorTintColor = UIColor.appYellow.withAlphaComponent(0.3)
        currentPageIndicatorTintColor = .appYellow
    }
}
