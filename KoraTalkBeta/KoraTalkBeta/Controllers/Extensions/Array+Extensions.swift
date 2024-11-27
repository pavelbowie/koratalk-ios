//
//  Array+Extensions.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

extension Array {
    var lastIndex: Int {
        return count > 0 ? endIndex - 1 : 0
    }
}
