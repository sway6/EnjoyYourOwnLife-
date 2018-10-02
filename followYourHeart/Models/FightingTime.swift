//
//  FightingTime.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/13/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import Foundation

class FightingTime {
    var startTime: String
    var endTime: String
    var startDate: Date
    var endDate: Date
    var taskDescription: String
    
    init(startTime: String, endTime: String, startDate: Date, endDate: Date, description: String) {
        self.startTime = startTime
        self.endTime = endTime
        self.startDate = startDate
        self.endDate = endDate
        self.taskDescription = description
    }
}
