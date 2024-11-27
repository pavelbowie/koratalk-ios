//
//  PasswordResetViewModel.swift
//  KoraTalk
//
//  Created by Pavel Mac on 30/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

protocol PasswordResetViewDataSource {}

protocol PasswordResetViewEventSource {}

protocol PasswordResetViewProtocol: PasswordResetViewDataSource, PasswordResetViewEventSource {
    func passwordReset(email: String)
}

final class PasswordResetViewModel: BaseViewModel<PasswordResetRouter>, PasswordResetViewProtocol {
    
}

// MARK: - Network
extension PasswordResetViewModel {
    
    func passwordReset(email: String) {
        showLoading?()
        let request = ForgotPasswordRequest(email: email)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(_):
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
