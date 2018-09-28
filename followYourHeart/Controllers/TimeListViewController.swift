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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    func setUpNavigationBar() {
        self.navigationItem.title = "Time List"
    }
    
    func setUpTimeList(timeList: [FightingTime]) {
        self.timeList = timeList
    }
    
    func addTask(task: FightingTime) {
        self.timeList.append(task)
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
        cell.timeLabel.text = fightingTime.startTime
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
}
