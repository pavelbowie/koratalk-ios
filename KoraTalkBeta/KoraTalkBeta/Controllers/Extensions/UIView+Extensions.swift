//
//  UIView+Extensions.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

extension UIView {

    func snapshotImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            return snapshotImageBlockBased()
        } else {
            return snapshotImageContextBased()
        }
    }

    @available(iOS 10.0, *)
    private func snapshotImageBlockBased() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { _ in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }

    private func snapshotImageContextBased() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, contentScaleFactor)
        drawHierarchy(in: bounds, afterScreenUpdates: true)

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
