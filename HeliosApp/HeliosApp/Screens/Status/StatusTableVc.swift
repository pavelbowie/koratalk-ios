//
//  StatusTableVc.swift
//  HeliosApp+Extension
//
//  Created by Pavel Mac on 25/09/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class StatusTableVc: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
