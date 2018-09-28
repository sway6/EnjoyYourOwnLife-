//
//  DiscriptionViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/9/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit


class DiscriptionViewController: UIViewController {

    private let startDatePickerTag = 1
    private let endDatePickerTag = 2
    var startDate: Date?
    var endDate: Date?
    var taskDescription: String?
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBAction func saveAction(_ sender: Any) {
        guard let controller = getTimeListController() else {
            return
        }
        let task = FightingTime(startTime: startTimeTextField.text ?? "",
                                endTime: endTimeTextField.text ?? "",
                                startDate: startDate ?? Date(),
                                endDate: endDate ?? Date(),
                                description: taskDescription ?? "")
        controller.timeList.append(task)
        self.navigationController?.popToViewController(controller, animated: true)
    }

    private var startTimeDatePicker: UIDatePicker?
    private var endTimeDatePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewTapRecoganizer()
        setUpDescriptionTextField()
        setUpStartTimeDatePicker()
        setUpEndTimeDatePicker()
    }
    
    func setUpViewTapRecoganizer() {
        let tapRecoganizer = UITapGestureRecognizer(target: self, action: #selector(DiscriptionViewController.viewTapped(gestureRecoganizer:)))
        view.addGestureRecognizer(tapRecoganizer)
    }
    
    @objc private func viewTapped(gestureRecoganizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func setUpStartTimeDatePicker() {
        startTimeDatePicker = UIDatePicker()
        startTimeDatePicker?.tag = startDatePickerTag
        startTimeDatePicker?.addTarget(self,
                                     action: #selector(dateChanged(datePicker:)),
                                     for: .valueChanged)
        startTimeTextField.inputView = startTimeDatePicker
    }
    
    func setUpEndTimeDatePicker() {
        endTimeDatePicker = UIDatePicker()
        endTimeDatePicker?.tag = endDatePickerTag
        endTimeDatePicker?.addTarget(self,
                                     action: #selector(dateChanged(datePicker:)),
                                     for: .valueChanged)
        endTimeTextField.inputView = endTimeDatePicker
    }
    
    func setUpDescriptionTextField() {
        descriptionTextField.placeholder = "discription for this time sheet:"
        descriptionTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.top
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        let dateString = dateFormatter.string(from: datePicker.date)
        if datePicker.tag == startDatePickerTag {
            startTimeTextField.text = dateString
            startDate = datePicker.date
        } else if datePicker.tag == endDatePickerTag {
            endTimeTextField.text = dateString
            endDate = datePicker.date
        }
    }
    
    func getTimeListController() -> TimeListViewController? {
        guard let naviController = self.navigationController else {
            return nil
        }
        for viewController in naviController.viewControllers {
            if viewController is TimeListViewController {
                return viewController as? TimeListViewController
            }
        }
        return nil
    }

}

extension DiscriptionViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
