//
//  MakeAppointmentViewController.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
//

import UIKit
import FSCalendar

class MakeAppointmentViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet weak var issueTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet var calendar : FSCalendar!
    @IBOutlet weak var timePicker: UIPickerView!


    private var deliveryTimes = ["8 - 8:30", "8:30 - 9", "9 - 9:30", "9:30 - 10",
                                 "10 - 10:30", "10:30 - 11", "11 - 11:30", "11:30 - 12", "13 - 13:30", "13:30 - 14", "14 - 14:30", "14:30 - 15", "15 - 15:30", "15:30 - 16", "16 - 16:30", "16:30 - 17"]
    var doctorId = ""
    var dateSelected = ""
    var appointment : Appointment?
    let formatter = DateFormatter()
    var doctor: Doctor?
    

    var patientId: String = BaseClient.shared.userId!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationTitle(title: "MAKE APPOINTMENT")
        
        setDelegate()

        print(doctorId)

    }
    
    private func setDelegate(){
        issueTextField.delegate = self
        detailTextField.delegate = self
        calendar.delegate = self
        timePicker.delegate = self
        timePicker.dataSource = self
    }

    //MARK: -button

    @IBAction func Booking(_ sender: Any) {
        print("\(deliveryTimes[self.timePicker.selectedRow(inComponent: 0)])")
        print(dateSelected)
                    let controller: ConfirmAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ConfirmAppointmentViewControllerId) as! ConfirmAppointmentViewController
                   // controller.statusId = 1
                        controller.issue = issueTextField.text ?? ""
                        controller.detail = detailTextField.text ?? ""
                        controller.time = deliveryTimes[self.timePicker.selectedRow(inComponent: 0)]
                        controller.dateMeeting = dateSelected
                        controller.doctor = doctor
                    self.navigationController?.pushViewController(controller, animated: true)
       
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
          self.dateSelected = formatter.string(from: date)
          self.view.endEditing(true)
    }
}

extension MakeAppointmentViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        deliveryTimes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return deliveryTimes[row]
    }
}

extension MakeAppointmentViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        hideKeyboardWhenTappedAround()
        return true
    }
}
