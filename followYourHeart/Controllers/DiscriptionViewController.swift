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
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    
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
        } else if datePicker.tag == endDatePickerTag {
            endTimeTextField.text = dateString
        }
    }
}

extension DiscriptionViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
