//
//  UITableView+Extensions.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
struct CellClassWrapper {

    private static let nibType = "nib"

    let cellClass: AnyClass?
    
    fileprivate var nib: UINib? {
        return cellClass
            .map( String.init(describing:) )
            .flatMap { Bundle.main.path(forResource: $0, ofType: CellClassWrapper.nibType) }
            .flatMap( URL.init )
            .map { $0.deletingPathExtension().lastPathComponent }
            .map { UINib(nibName:$0, bundle: nil) }
    }
}

extension UITableView {
    func register(_ wrapper: CellClassWrapper, forCellReuseIdentifier identifier: String) {
        if let nib = wrapper.nib {
            register(nib, forCellReuseIdentifier: identifier)
        } else {
            register(wrapper.cellClass, forCellReuseIdentifier: identifier)
        }
    }
}
