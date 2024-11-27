//
//  WalkThroughViewModel.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import MobilliumUserDefaults

protocol WalkThroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkThroughCellProtocol
}

protocol WalkThroughViewEventSource {}

protocol WalkThroughViewProtocol: WalkThroughViewDataSource, WalkThroughViewEventSource {
    func didFinishWalkThroughScene()
}

final class WalkThroughViewModel: BaseViewModel<WalkThroughRouter>, WalkThroughViewProtocol {
    
    private var cellItems: [WalkThroughCellProtocol] = [WalkThroughCellModel(image: .imgWalkthrough1,
                                                                             titleText: L10n.Modules.WalkThrough.firstTitle,
                                                                             descriptionText: L10n.Modules.WalkThrough.descriptionText),
                                                        WalkThroughCellModel(image: .imgWalkthrough2,
                                                                             titleText: L10n.Modules.WalkThrough.secondTitle,
                                                                             descriptionText: L10n.Modules.WalkThrough.descriptionText),
                                                        WalkThroughCellModel(image: .imgWalkthrough3,
                                                                             titleText: L10n.Modules.WalkThrough.thirdTitle,
                                                                             descriptionText: L10n.Modules.WalkThrough.descriptionText),
                                                        WalkThroughCellModel(image: .imgWalkthrough4,
                                                                             titleText: L10n.Modules.WalkThrough.fourthTitle,
                                                                             descriptionText: L10n.Modules.WalkThrough.descriptionText)]
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> WalkThroughCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Actions
extension WalkThroughViewModel {
    
    func didFinishWalkThroughScene() {
        DefaultsKey.isWalkThroughCompleted.value = true
        router.placeOnWindowInMainTabBar()
    }
}
