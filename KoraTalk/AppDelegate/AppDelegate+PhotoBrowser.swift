//
//  AppDelegate+PhotoBrowser.swift
//  KoraTalk
//
//  Created by Pavel Mac on 23/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SKPhotoBrowser

extension AppDelegate {

    func configureSKPhotoBrowser() {
          SKPhotoBrowserOptions.displayAction = false
          SKPhotoBrowserOptions.displayHorizontalScrollIndicator = false
          SKPhotoBrowserOptions.displayVerticalScrollIndicator = false
          SKPhotoBrowserOptions.displayCounterLabel = true
          SKCache.sharedCache.imageCache = PhotoBrowserCache()
      }
}
