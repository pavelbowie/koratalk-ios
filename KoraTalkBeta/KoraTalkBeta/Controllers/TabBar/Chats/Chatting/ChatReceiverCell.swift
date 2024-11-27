//
//  ChatReceiverCell.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 17/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ChatReceiverCell: UITableViewCell {

    @IBOutlet weak var receiverIdentityLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var chattingImageView: UIImageView!
    @IBOutlet weak var chatImageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chattingImageView.layer.cornerRadius = 10.0
        chattingImageView.layer.borderWidth = 1.0
        chattingImageView.layer.borderColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        messageView.layer.cornerRadius = 10.0
        messageView.layer.borderWidth = 1.0
        messageView.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        receiverIdentityLabel.text = ""
        messageLabel.text = ""
        chattingImageView.image = nil
    }
}
