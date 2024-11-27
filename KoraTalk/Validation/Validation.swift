//
//  Validation.swift
//  KoraTalk
//
//  Created by Pavel Mac on 30/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

class Validation {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            ToastPresenter.showWarningToast(text: "Please wait")
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: "Password must be minimum 6 symbols")
            return false
        }
        return true
    }
}
