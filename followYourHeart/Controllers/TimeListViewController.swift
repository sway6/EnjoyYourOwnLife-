//
//  TimeListViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/9/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController {

    @IBAction func addTimeSheet(_ sender: Any) {
        performSegue(withIdentifier: "ShowTimeSheetDiscription", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    func setUpNavigationBar() {
        self.navigationItem.title = "Time List"
    }
}
