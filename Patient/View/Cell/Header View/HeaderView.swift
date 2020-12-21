//
//  headerView.swift
//  youMed
//
//  Created by thinhdang on 10/23/20.
//

import UIKit

protocol DoctorViewProtocol : AnyObject {
    func doctorPage()
}

protocol HospitalViewProtocol : AnyObject {
    func hospitalPage()
}


class HeaderView: UITableViewHeaderFooterView {
    
    weak var delegateDoctor: DoctorViewProtocol?
    weak var delegateHospital: HospitalViewProtocol?
    
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var hospitalView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let doctorTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doctorHandleTap(_:)))
        doctorView.addGestureRecognizer(doctorTapGestureRecognizer)
      
        let hospitalTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hospitalHandleTap(_:)))
        hospitalView.addGestureRecognizer(hospitalTapGestureRecognizer)
    }
    
    @objc func doctorHandleTap(_ sender: UITapGestureRecognizer) {
        print("a")
        delegateDoctor?.doctorPage()
    }
    @objc func hospitalHandleTap(_ sender: UITapGestureRecognizer) {
        delegateHospital?.hospitalPage()
    }
}
