//
//  headerView.swift
//  youMed
//
//  Created by Duy Dinh on 10/23/20.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var clinicView: UIView!
    @IBOutlet weak var hospitalView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let doctorTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doctorHandleTap(_:)))
        doctorView.addGestureRecognizer(doctorTapGestureRecognizer)
        let clinicTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clinicHandleTap(_:)))
        clinicView.addGestureRecognizer(clinicTapGestureRecognizer)
        let hospitalTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hospitalHandleTap(_:)))
        hospitalView.addGestureRecognizer(hospitalTapGestureRecognizer)
    }
    
    @objc func doctorHandleTap(_ sender: UITapGestureRecognizer) {
        print("a")
    }
    @objc func clinicHandleTap(_ sender: UITapGestureRecognizer) {
        print("b")
    }
    @objc func hospitalHandleTap(_ sender: UITapGestureRecognizer) {
        print("c")
    }
}
