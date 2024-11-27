//
//  ActiveChatsCell.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 17/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ActiveChatsCell: UITableViewCell {
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        friendImageView.layer.cornerRadius = friendImageView.frame.size.width/2
        friendImageView.layer.borderWidth = 1.5
        friendImageView.layer.borderColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        friendImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        friendImageView.image = nil
        friendNameLabel.text = ""
        lastMessageLabel.text = ""
        dateAndTimeLabel.text = ""
    }
}
