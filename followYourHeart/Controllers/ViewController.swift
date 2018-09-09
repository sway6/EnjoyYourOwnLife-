//
//  ViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/8/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func startButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "GetMyTimeList", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

