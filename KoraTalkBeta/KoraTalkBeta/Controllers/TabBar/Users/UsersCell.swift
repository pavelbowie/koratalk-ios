//
//  UsersCell.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        userImageView.layer.borderWidth = 1.5
        userImageView.layer.borderColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        userImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
        userNameLabel.text = ""
    }
}
