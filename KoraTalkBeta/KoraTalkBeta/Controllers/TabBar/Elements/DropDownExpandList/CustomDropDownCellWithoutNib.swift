//
//  CustomDropDownCellWithoutNib.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
//import Kor/////

final class CustomDropDownCellWithoutNib: DropDownCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("Not implemented!")
    }

    // MARK: - Public API
    func configureUsing(_ model: Meal) {
        textLabel?.text = model.name
        imageView?.image = model.image
    }

    override func prepareForReuse() {
        textLabel?.text = nil
        imageView?.image = nil
    }

    // MARK: - Private API
    private func setup() {
        backgroundColor = .lightGray
    }
}
