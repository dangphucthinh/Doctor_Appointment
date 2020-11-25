//
//  DoctorConfirmationView.swift
//  youMed
//
//  Created by Oscar on 11/25/20.
//

import UIKit

class DoctorConfirmationView: UIView {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecialties: UILabel!
    @IBOutlet weak var lbHospital: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    var data: Doctor? {
        didSet {
            guard let data = data else { return }
            
            lbName.text = data.fullName?.uppercased()
            lbSpecialties.text = data.specialtyName
            lbHospital.text = data.hospitalSpecialty_Name
        }
    }
 
    override func draw(_ rect: CGRect) {
        // Drawing code
        shadowView.layer.cornerRadius = 10
         
        // border
        shadowView.layer.borderWidth = 1.0
        shadowView.layer.borderColor = UIColor.link.cgColor
         
        // shadow
        shadowView.layer.shadowColor = UIColor.link.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowRadius = 4.0
    }

}
