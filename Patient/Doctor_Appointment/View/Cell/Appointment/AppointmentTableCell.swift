//
//  AppointmentTableCell.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/5/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift

class AppointmentTableCell: UITableViewCell {

    @IBOutlet weak var doctorNameLb : UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var data:Appointment?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ name: String, _ phone: String){
        doctorNameLb.text = name
        phoneNumber.text = phone
    }
}
