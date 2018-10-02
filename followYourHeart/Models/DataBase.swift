//
//  DataBase.swift
//  followYourHeart
//
//  Created by Bai xinrui on 10/1/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import Foundation
import UIKit

class DataBase {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = DataBase.appDelegate.persistentContainer.viewContext
}
