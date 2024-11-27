//
//  DropDownMenuConfigurator.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public struct DropDownMenuConfigurator {

    private let menu: DropDownMenu

    init(wrapped: DropDownMenu) {
        menu = wrapped
    }
}

public extension DropDownMenuConfigurator {

    @discardableResult
    func numberOfItems(_ number: Int) -> DropDownMenuConfigurator {
        menu._numberOfItems = number
        return self
    }

    @discardableResult
    func cellClass(_ aClass: DropDownCell.Type) -> DropDownMenuConfigurator {
        menu._cellClass = aClass
        return self
    }

    @discardableResult
    func didSelectItem(_ closure: @escaping (_ index: Int) -> Void) -> DropDownMenuConfigurator {
        menu._didSelectItem = closure
        return self
    }

    @discardableResult
    func willDisplayCell(_ closure: @escaping (_ cell: DropDownCell, _ index: Int) -> Void) -> DropDownMenuConfigurator {
        menu._willDisplayCell = closure
        return self
    }

    @discardableResult
    func updateThumbnailOnSelection(_ flag: Bool) -> DropDownMenuConfigurator {
        menu._updateThumbnailOnSelection = flag
        return self
    }
}
