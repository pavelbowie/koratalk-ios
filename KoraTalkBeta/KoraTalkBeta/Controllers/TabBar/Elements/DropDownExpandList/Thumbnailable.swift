//
//  Thumbnailable.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public protocol Thumbnailable {
    var thumbnailView: UIView { get }
}

public extension Thumbnailable where Self: DropDownCell {
    var thumbnailView: UIView {
        return contentView
    }
}
