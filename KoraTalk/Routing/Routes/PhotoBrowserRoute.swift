//
//  SKPhotoBrowserRoute.swift
//  KoraTalk
//
//  Created by Pavel Mac on 2/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SKPhotoBrowser

protocol PhotoBrowserRoute {
    func presentPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate)
}

extension PhotoBrowserRoute where Self: RouterProtocol {
    
    func presentPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate) {
        let skPhotos = photos.map { SKPhoto.photoWithImageURL($0) }
        let photoBrowser = SKPhotoBrowser(photos: skPhotos, initialPageIndex: initialPageIndex)
        photoBrowser.delegate = delegate
        viewController.present(photoBrowser, animated: true)
    }
}
