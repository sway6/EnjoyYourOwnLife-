//
//  DiscriptionViewController.swift
//  followYourHeart
//
//  Created by Bai xinrui on 9/9/18.
//  Copyright © 2018 Bai xinrui. All rights reserved.
//

import UIKit

class DiscriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBAction func showTimeSetting(_ sender: Any) {
        showTimeSettingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDescriptionTextField()
    }
    
    func setUpDescriptionTextField() {
        descriptionTextField.placeholder = "discription for this time sheet:"
        descriptionTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.top
    }
    
    func showTimeSettingView() {
        let timeSettingPopOVerController = TimeInputController()
        timeSettingPopOVerController.modalPresentationStyle = .overCurrentContext
        timeSettingPopOVerController.modalTransitionStyle = .crossDissolve
        self.present(timeSettingPopOVerController, animated: true, completion: nil)
    }
}

extension DiscriptionViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
