//
//  DescriptionTableViewModel.swift
//  followYourHeart
//
//  Created by Bai xinrui on 10/13/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import Foundation

class DescriptionTableViewModel {
    let task: FightingTime
    
    init(task: FightingTime) {
        self.task = task
    }
    
    func getDescription() -> String {
        if task.taskDescription.count == 0 {
            return "NO Task Description"
        }
        return task.taskDescription
    }
    
    func getStartTime() -> String {
        if task.startTime.count == 0 {
            return "NO Start Time"
        }
        return task.startTime
    }
    
    func getEndTime() -> String {
        if task.endTime.count == 0 {
            return "NO End time"
        }
        return task.endTime
    }
}
