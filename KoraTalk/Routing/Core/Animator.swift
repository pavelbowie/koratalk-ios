//
//  Animator.swift
//  KoraTalkRouting
//
//  Created by Pavel Mac on 2/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
