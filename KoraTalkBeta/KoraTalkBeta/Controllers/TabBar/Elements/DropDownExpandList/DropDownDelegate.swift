//
//  DropDownDelegate.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public protocol DropDownDelegate: AnyObject {

    func numberOfItems(in dropDownMenu: DropDownMenu) -> Int

    func cellClass(for dropDownMenu: DropDownMenu) -> DropDownCell.Type

    func dropDownMenu(_ dropDownMenu: DropDownMenu, didSelectItemAt index: Int)

    func dropDownMenu(_ dropDownMenu: DropDownMenu, willDisplay cell: DropDownCell, forRowAt index: Int)
    
    func updateThumbnailOnSelection(in dropDownMenu: DropDownMenu) -> Bool
}

public extension DropDownDelegate {

    func cellClass(for dropDownMenu: DropDownMenu) -> DropDownCell.Type { return DropDownCell.self }

    func dropDownMenu(_ dropDownMenu: DropDownMenu, didSelectItemAt index: Int) {}

    func dropDownMenu(_ dropDownMenu: DropDownMenu, willDisplay cell: DropDownCell, forRowAt index: Int) {}

    func updateThumbnailOnSelection(in dropDownMenu: DropDownMenu) -> Bool { return false }
}
