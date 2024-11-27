//
//  SKPhotoBrowserKingfisherCache.swift
//  KoraTalk
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SKPhotoBrowser
import Kingfisher

class SKPhotoBrowserKingfisherCache: SKImageCacheable {

    let cache = ImageCache.default

    func imageForKey(_ key: String) -> UIImage? {
        cache.retrieveImageInMemoryCache(forKey: key)
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.store(image, forKey: key)
    }

    func removeImageForKey(_ key: String) {
        cache.removeImage(forKey: key)
    }

    func removeAllImages() {
        //
    }

}
