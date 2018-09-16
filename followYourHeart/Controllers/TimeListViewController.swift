//
//  TimeListViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/9/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController {
    @IBOutlet weak var timeListTableView: UITableView!
    let TimeTableCelId = "timeCell"
    var timeList: [FightingTime] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        timeListTableView.delegate = self
        timeListTableView.dataSource = self
        timeListTableView.register(UINib(nibName: "TimeListCell", bundle: nil), forCellReuseIdentifier: TimeTableCelId)
        timeListTableView.tableFooterView = UIView()
    }
    
    func setUpNavigationBar() {
        self.navigationItem.title = "Time List"
    }
    
    func setUpTimeList(timeList: [FightingTime]) {
        self.timeList = timeList
    }
    
    func getTomorrowTime(timePoint: FightingTimePoint) -> Date? {
        guard let tomorrowDate = Date().tomorrow else { return nil }
        let calendar = Calendar.current
        let components: Set<Calendar.Component> = [.era, .year, .month, .day]
        var tomorrowValidTime = calendar.dateComponents(components, from: tomorrowDate)
        tomorrowValidTime.hour = timePoint.hour
        tomorrowValidTime.minute = timePoint.min
        return calendar.date(from: tomorrowValidTime)
    }

    @IBAction func addTimeSheet(_ sender: Any) {
        performSegue(withIdentifier: "ShowTimeSheetDiscription", sender: self)
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
        if let tomorrowTimePoint = getTomorrowTime(timePoint: fightingTime.startTime) {
            let hour = Calendar.current.component(.hour, from: tomorrowTimePoint)
            cell.timeLabel.text = String(hour) + " AM"
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
