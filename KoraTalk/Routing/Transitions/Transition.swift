//
//  Transition.swift
//  KoraTalkRouting
//
//  Created by Pavel Mac on 2/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
