//
//  headerView.swift
//  youMed
//
//  Created by Duy Dinh on 10/23/20.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var imgHospital: UIView!
    @IBOutlet weak var imgDoctor: UIView!
    @IBOutlet weak var imgClinic: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageDoctorTap = UITapGestureRecognizer(target: self, action: #selector(doctorTap)) //declear tap view
        imgDoctor.addGestureRecognizer(imageDoctorTap)
        
        let imageClinicTap = UITapGestureRecognizer(target: self, action: #selector(clinicTap))
        imgClinic.addGestureRecognizer(imageClinicTap)
        
        let imageHospitalTap = UITapGestureRecognizer(target: self, action: #selector(hospitalTap))
        imgHospital.addGestureRecognizer(imageHospitalTap)
    }
    
    @objc func doctorTap(_ sender: UITapGestureRecognizer){
        print("aa")
    }
    
    @objc func clinicTap(_ sender: UIGestureRecognizer){
        print("bb")
    }
    
    @objc func hospitalTap(_ sender: UIGestureRecognizer){
        print("cc")
    }
}
