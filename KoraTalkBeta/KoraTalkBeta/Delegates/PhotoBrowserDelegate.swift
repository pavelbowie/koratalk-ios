//
//  SKPhotoBrowserDelegate.swift
//  KoraTalk
//
//  Created by Pavel Mac on 2/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate {

    var willDismissAtPage: IntClosure?

    func willDismissAtPageIndex(_ index: Int) {
        if let didDismiss = willDismissAtPage {
            didDismiss(index)
        }
    }
    
}
