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
        
        calendar.delegate = self
        timePicker.delegate = self
        timePicker.dataSource = self

        print(doctorId)

    }

    //MARK: -button

    @IBAction func Booking(_ sender: Any) {
        print("\(deliveryTimes[self.timePicker.selectedRow(inComponent: 0)])")
        print(dateSelected)
//
        Loading.showLoading(message: Message.LoadingMessage, view: self.view)
        BaseClient.shared.MakeAnAppointment(doctorId: doctorId,
                                            patientId: patientId,
                                            meetingTime: formatter.date(from: dateSelected)!,
                                            startTime: deliveryTimes[self.timePicker.selectedRow(inComponent: 0)],
                                            issue: issueTextField.text ?? "No thing",
                                            detail: detailTextField.text ?? "Nothing",
                                            completion: {
                    (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                    Loading.dismissLoading()
                    //print(error!)
                    let rs = value as! ResponseAppointment
                    print(rs)
                    if rs.status == 1{
                        let alert = UIAlertController(title: "My Title", message: "Can not appointment this time", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                                                
                        if rs.status == 0{
                            let alert = UIAlertController(title: "My Title", message: "Success", preferredStyle: UIAlertController.Style.alert)

                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                                                }
//                    let controller: ConfirmAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ConfirmAppointmentViewControllerId) as! ConfirmAppointmentViewController
//                   // controller.statusId = 1
//                        controller.issue = issueTextField.text ?? ""
//                        controller.detail = detailTextField.text ?? ""
//                        controller.time = deliveryTimes[self.timePicker.selectedRow(inComponent: 0)]
//                        controller.dateMeeting = dateSelected
//                        controller.doctor = doctor
//                    self.navigationController?.pushViewController(controller, animated: true)

                    })
       
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
