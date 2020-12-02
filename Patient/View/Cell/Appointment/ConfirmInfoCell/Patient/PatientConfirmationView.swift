//
//  PatientConfirmationView.swift
//  youMed
//
//  Created by Oscar on 11/24/20.
//

import UIKit

class PatientConfirmationView: UIView {

    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
    private var fillColor: UIColor = .blue // the color applied to the shadowLayer, rather than the view's backgroundColor
     @IBOutlet weak var shadowView: UIView!
     @IBOutlet weak var lbName: UILabel!
     @IBOutlet weak var lbBirthday: UILabel!
     @IBOutlet weak var lbPhone: UILabel!
     @IBOutlet weak var lbIssue: UILabel!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var data: Patient? {
        didSet {
            guard let data = data else { return }
            
            //lbBirthday.text = data.dateOfBirth
            lbName.text = data.fullName?.uppercased()
            lbPhone.text = data.phoneNumber
            lbBirthday.text = dateToSQLDate(data.dateOfBirth ?? "")
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
