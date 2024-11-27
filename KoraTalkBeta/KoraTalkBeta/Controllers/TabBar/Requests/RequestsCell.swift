//
//  RequestsCell.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 16/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class RequestsCell: UITableViewCell {

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var acceptRequestButton: UIButton!
    @IBOutlet weak var rejectRequestButton: UIButton!

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
    }
}
