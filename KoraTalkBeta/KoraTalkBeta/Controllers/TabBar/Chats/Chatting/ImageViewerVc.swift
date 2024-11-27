//
//  ImageViewerVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 19/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import SDWebImage

class ImageViewerVc: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var userImg = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.sd_setImage(with: URL(string: userImg), placeholderImage: #imageLiteral(resourceName: "def"))
    }
    
    //MARK:- Dismiss Screen
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
