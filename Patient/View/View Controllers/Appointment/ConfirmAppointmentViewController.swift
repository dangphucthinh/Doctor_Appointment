//
//  ConfirmAppointmentViewController.swift
//  youMed
//
//  Created by Oscar on 11/24/20.
//

import UIKit

class ConfirmAppointmentViewController: UIViewController {

    @IBOutlet weak var lbPatient: UILabel!
    @IBOutlet weak var lbDoctor: UILabel!
    var users: Patient?
    var doctor: Doctor?
    let formatter = DateFormatter()
    var issue:String?
    var time: String?
    var dateMeeting = ""
    var detail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDataPatient()
        loadDataDoctor()
 
    }
    
    private func loadDataPatient(){
            
        let userView = Bundle.main.loadNibNamed(StoryboardID.PatientConfirmationViewId, owner: self, options: nil)?.first as? PatientConfirmationView
        userView?.frame = CGRect(x: 20, y: 151, width: 374, height: 200)
       // LoadInform(UserId: BaseClient.shared.userId!)
        //userView?.data = users
        userView?.LoadInform(UserId: BaseClient.shared.userId!)
        userView?.lbIssue.text = issue
        view.addSubview(userView!)
    }
    
    private func loadDataDoctor(){
        let doctorView = Bundle.main.loadNibNamed(StoryboardID.DoctorConfirmationViewId, owner: self, options: nil)?.first as? DoctorConfirmationView
        doctorView?.frame = CGRect(x: 20, y: 449, width: 374, height: 250)
        doctorView?.data = doctor
        doctorView?.lbTime.text = time
        doctorView?.lbDate.text = dateMeeting
        view.addSubview(doctorView!)
    }
    


    
    @IBAction func makeAppointment(_ sender: Any) {
        print(dateMeeting)
        

        BaseClient.shared.MakeAnAppointment(doctorId: doctor!.id!,
                                            patientId: BaseClient.shared.userId!,
                                            meetingTime: self.stringToDate(dateMeeting) ,
                                            startTime: time!,
                                            issue: issue!,
                                            detail: detail!,
                                            completion: {
                                                (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                let rs = value as! ResponseAppointment
                                                print(rs)
                                                if rs.status == 1{
                                                    let alert = UIAlertController(title: "My Title", message: "Can not appointment this time", preferredStyle: UIAlertController.Style.alert)

                                                    // add an action (button)
                                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                                    // show the alert
                                                    self.present(alert, animated: true, completion: nil)
                                                }
                                                if rs.status == 0 {
                                                    let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
                                                    controller.statusId = 1

                                                    self.navigationController?.pushViewController(controller, animated: true)
                                                }
                                            })
    }
}
