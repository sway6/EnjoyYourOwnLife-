//
//  Date+TomorrowDate.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/16/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import Foundation

extension Date {
    
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
}
