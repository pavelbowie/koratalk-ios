//
//  RegisterViewModel.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func showLoginScreen()
    func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    //
}

// MARK: - Actions
extension RegisterViewModel {
    
    func showLoginScreen() {
        router.close()
    }
}

// MARK: - Network
extension RegisterViewModel {
    
    func sendRegisterRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(username: username, email: email, password: password)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                print(response.token)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
            }
        }
    }
}
