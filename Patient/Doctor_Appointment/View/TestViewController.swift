//
//  TestViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 11/4/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import FSCalendar

class TestViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet weak var issueTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet var calendar : FSCalendar!
    @IBOutlet weak var timePicker: UIPickerView!
  
    private var deliveryTimes = ["8 AM - 8:30 AM", "8:30 AM - 9 AM", "9 AM - 9:30 AM", "9:30 AM - 10 AM", "10 AM - 10:30 AM", "10:30 AM - 11 AM", "11 AM - 11:30 AM", "11:30 AM - 12 PM", "13 PM - 13:30 PM", "13:30 PM - 14 PM", "14 PM - 14:30 PM", "14:30 PM - 15 PM", "15 PM - 15:30 PM", "15:30 PM - 16 PM", "16 PM - 16:30 PM", "16:30 PM - 17 PM"]
    var string = ""
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calendar.delegate = self
        
        timePicker.delegate = self
        timePicker.dataSource = self
       
    }
    //MARK: -button

    @IBAction func Booking(_ sender: Any) {
//        print("\(deliveryTimes[self.timePicker.selectedRow(inComponent: 0)])")
//        print(string)
//        
//        let controller: CodeViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.CodeViewControllerId) as! CodeViewController
//        //controller.stringb = deliveryTimes[self.timePicker.selectedRow(inComponent: 0)]
//    
//        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    //MARK: -calendar
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        
        let curDate = Date().addingTimeInterval(-24*60*60)
        
        if date < curDate {
            return false
        } else {
            return true
        }
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
          formatter.dateFormat = "MM/dd/yyyy"
          self.string = formatter.string(from: date)//(from: datePicker.date)
          self.view.endEditing(true)
          //print(string)
    }
}

extension TestViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        deliveryTimes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return deliveryTimes[row ]
    }
    
     
}
