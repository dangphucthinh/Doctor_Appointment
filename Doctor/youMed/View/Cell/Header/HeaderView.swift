//
//  HeaderView.swift
//  Doctor_Appointment
//
//  Created by DUY on 9/22/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift

protocol patientViewProtocol : AnyObject {
    func patientPage()
}
class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    var name = BaseClient.shared.fullName
    var UserId = BaseClient.shared.userId
    var listAppointment = List<Appointment>()
    
    weak var patientDelegate: patientViewProtocol?
    
    func loadRequestAppointment(){
        BaseClient.shared.GetListAppointment(userId: UserId!,
                                             statusId: 1,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                              let listTemp = rs.data as List<Appointment>

                                for item in listTemp{
                                    self.listAppointment.append(item)
                                }
                                if listAppointment.count <= 1 {
                                    secondViewLabel.text = "You have \(listAppointment.count) PATIENT are waiting"
                                }
                                else {
                                    secondViewLabel.text = "You have \(listAppointment.count) PATIENTS are waiting"
                                }
                                
                                secondViewLabel.textColor = .red
                     })
    }
    
    
    override func awakeFromNib() {
        firstView.layer.cornerRadius = CGFloat(30)
        lbTitle.text = "Hello, How are you ? \(name!)"
        secondView.roundedView(cornerRadius: 15, borderWidth: 2, borderCorlor: Color.borderColor)
        let doctorTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doctorHandleTap(_:)))
        secondView.addGestureRecognizer(doctorTapGestureRecognizer)
    }
    
    @objc func doctorHandleTap(_ sender: UITapGestureRecognizer) {
        //print("a")
        patientDelegate?.patientPage()
    }
}
