//
//  TimeListViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/9/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit
import CoreData

class TimeListViewController: UIViewController {
    @IBOutlet weak var timeListTableView: UITableView!
    
    @IBAction func addTimeSheet(_ sender: Any) {
        performSegue(withIdentifier: "ShowTimeSheetDiscription",
                     sender: self)
    }
    
    let TimeTableCelId = "timeCell"
    var timeList: [FightingTime] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timeList = [FightingTime]()
        getTaskFromDB()
        timeListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        timeListTableView.delegate = self
        timeListTableView.dataSource = self
        timeListTableView.register(UINib(nibName: "TimeListCell", bundle: nil), forCellReuseIdentifier: TimeTableCelId)
        timeListTableView.tableFooterView = UIView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func getTaskFromDB() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Config.entityName)
        request.returnsObjectsAsFaults = false
        
        do {
            let result =  try DataBase.context.fetch(request)
            guard let tasks = result as? [NSManagedObject] else {
                return
            }
            for data in tasks {
                insertTaskIntoDataSource(task: data)
            }
        } catch {
            print("Get Task From DataBase Failed")
        }
    }
    
    func insertTaskIntoDataSource(task: NSManagedObject) {
        let startTime = task.value(forKey: "startTime") as? String ?? ""
        let endTime = task.value(forKey: "endTime") as? String ?? ""
        let startDate = task.value(forKey: "startDate") as? Date ?? Date()
        let endDate = task.value(forKey: "endDate") as? Date ?? Date()
        let taskDescription = task.value(forKey: "taskDescription") as? String ?? ""
        
        let task = FightingTime(startTime: startTime,
                                endTime: endTime,
                                startDate: startDate,
                                endDate: endDate,
                                description: taskDescription)
        
        timeList.append(task)
    }
    
    func setUpNavigationBar() {
        self.navigationItem.title = "Time List"
    }
    
    func setUpTimeList(timeList: [FightingTime]) {
        self.timeList = timeList
    }
    
    func addTask(task: FightingTime) {
        self.timeList.append(task)
    }

}

extension TimeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= timeList.count {
            return UITableViewCell()
            
        }
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: TimeTableCelId, for: indexPath) as? TimeListCell else {
            return UITableViewCell()
        }
        
        let fightingTime = timeList[indexPath.row]
        cell.timeLabel.text = fightingTime.startTime
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
}
