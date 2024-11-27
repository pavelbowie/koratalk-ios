//
//  LoginWarningPopupViewModel.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

protocol LoginWarningPopupViewDataSource {}

protocol LoginWarningPopupViewEventSource {
    var loginHandler: VoidClosure? { get set }
}

protocol LoginWarningPopupViewProtocol: LoginWarningPopupViewDataSource, LoginWarningPopupViewEventSource {
    func giveUpButtonAction()
    func loginButtonAction()
}

final class LoginWarningPopupViewModel: BaseViewModel<LoginWarningPopupRouter>, LoginWarningPopupViewProtocol {
        
    var loginHandler: VoidClosure?
    
    func giveUpButtonAction() {
        router.close()
    }
    func loginButtonAction() {
        router.close()
        loginHandler?()
    }
}
