//
//  FightingTime.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/13/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import Foundation

struct FightingTime {
    // time to:
    //    1. show on messageList
    //    2. push a local notification as a start time
    let startTime: FightingTimePoint
    
    // time to push a local notification as a end time
    let timeInterval: FightingTimeInterval
}

struct FightingTimePoint {
    let hour: Int
    let min: Int
}

struct FightingTimeInterval {
    let hour: Int
    let min: Int
}
