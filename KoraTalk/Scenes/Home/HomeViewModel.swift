//
//  HomeViewModel.swift
//  KoraTalk
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

protocol HomeViewDataSource {
    var segmentedControlTitles: [String] { get }
    var selectedSegmentIndex: Int { get }
}

protocol HomeViewEventSource {
    var didSuccesLogout: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func pushDetailViewController(recipeId: Int)
    func userLogout()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var segmentedControlTitles: [String] = [L10n.Modules.Home.editorChoiceRecipes,
                                            L10n.Modules.Home.lastAddedRecipes]
    
    var selectedSegmentIndex = 0
    var didSuccesLogout: VoidClosure?
}

// MARK: - Actions
extension HomeViewModel {
    
    func pushDetailViewController(recipeId: Int) {
        router.pushRecipeDetail(recipeId: recipeId)
    }
}

// MARK: - Network
extension HomeViewModel {
    
    func userLogout() {
        showLoading?()
        let request = LogoutRequest()
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.didSuccesLogout?()
                print(response.message ?? "didSuccesLogout")
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
