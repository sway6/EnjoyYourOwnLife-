//
//  DescriptionTableViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 10/3/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit

class DescriptionTableViewController: UITableViewController {
    
    @IBOutlet var descriptionTableView: UITableView!
    var viewModel: DescriptionTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTableView.tableFooterView = UIView()
    }
}

extension DescriptionTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            cell.textLabel?.text = viewModel?.getDescription()
        } else if indexPath.section == 1 {
            cell.textLabel?.text = viewModel?.getStartTime()
        } else if indexPath.section == 2 {
            cell.textLabel?.text = viewModel?.getEndTime()
        }
        cell.textLabel?.textColor = UIColor.orange
        return cell
    }
}
