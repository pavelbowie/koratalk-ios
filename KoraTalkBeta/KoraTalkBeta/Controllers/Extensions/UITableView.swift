//
//  UITableView.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 20/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func lastIndexPath() -> IndexPath {
        let section = max(numberOfSections - 1, 0)
        let row = max(numberOfRows(inSection: section) - 1, 0)
        return IndexPath(row: row, section: section)
    }
}
