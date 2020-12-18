//
//  PatientProfileViewController.swift
//  youMed
//
//  Created by Oscar on 12/7/20.
//

import UIKit

class PatientProfileViewController: UIViewController {

    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbIssue: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    var data : Appointment?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbName.text = data?.patientName
        lbDate.text = dateToSQLDate(data!.meetingTime!)
        lbTime.text = data?.startTime
        lbIssue.text = data?.issue
        lbDetail.text = data?.detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ContentView.roundedView(cornerRadius: 10, borderWidth: 3, borderCorlor: .init(red: 0, green: 0, blue: 0, alpha: 0))

    
        lbName.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 220, alpha: 0.5), margin: 10)
        lbDate.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 220, alpha: 0.5), margin: 10)
        lbTime.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 220, alpha: 0.5), margin: 10)
        lbIssue.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 220, alpha: 0.5), margin: 10)
        lbDetail.roundedLabel(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 220, alpha: 0.5), margin: 10)
    }
    @IBAction func btnDone(_ sender: Any) {
        Loading.showLoading(message: Message.LoadingMessage, view: self.view)
        BaseClient.shared.UpdateAppointment(id: (data?.id)! ,
                                            issue: lbIssue.text!,
                                            detail: lbDetail.text!,
                                            statusId: 4,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                Loading.dismissLoading()
                            let rs = value as! ResponseListAppointment

                                if rs.status == 0{
                                    let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.MainViewControllerId) as! MainViewController

                                     self.navigationController?.pushViewController(controller, animated: true)
            }
        })
    }
}
