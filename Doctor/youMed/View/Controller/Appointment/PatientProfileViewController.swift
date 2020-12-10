//
//  PatientProfileViewController.swift
//  youMed
//
//  Created by Oscar on 12/7/20.
//

import UIKit

class PatientProfileViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbIssue: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    @IBOutlet weak var ContentView: UIView!
    var data: Appointment?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationTitle(title: "APPOINTMENT") 
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customView()
        
    }
    
    private func customView(){
        lbName.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColor, margin: 15)
        lbDate.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColor, margin: 15)
        lbTime.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColor, margin: 15)
        lbIssue.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColor, margin: 15)
        lbDetail.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColor, margin: 15)
        ContentView.roundedView(cornerRadius: 15, borderWidth: 2, borderCorlor: Color.borderColor)
    }
    
    private func loadData(){
        lbName.text = data?.patientName?.uppercased()
        lbDate.text = dateToSQLDate(data?.meetingTime ?? "")
        lbTime.text = data?.startTime
        lbIssue.text = data?.issue
        lbDetail.text = data?.detail
    }
    @IBAction func appointmentDone(_ sender: Any) {
        BaseClient.shared.UpdateAppointment(id: (data?.id)! ,
                                            issue: (data?.issue)!,
                                            detail: (data?.detail)!,
                                            statusId: 3,
                                             completion: {
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                                if rs.status == 0{
                                let controller: MainViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MainViewControllerId) as! MainViewController
                                self.navigationController?.pushViewController(controller, animated: true)
            } 
                                                
        })
    }
}
