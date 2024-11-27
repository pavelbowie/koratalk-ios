//
//  UIString.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 20/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
