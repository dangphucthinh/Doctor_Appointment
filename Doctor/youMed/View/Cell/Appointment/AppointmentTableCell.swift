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
    
    let formatter = DateFormatter()
    var returnDate = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     
        
    }
    
  
    func commonInit(_ name: String, _ phone: String, _ date: String){
        doctorNameLb.text = name
        phoneNumber.text = phone
        dateLb.text = dateToSQLDate(date)
            
    }
    
    
    private func dateToSQLDate(_ DateString: String) -> String {
  
        let dateFormatter = DateFormatter()
       // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let string = String(DateString)
        if let date = dateFormatter.date(from: string) {
        dateFormatter.dateFormat = "MM/dd/yyyy"
            returnDate = dateFormatter.string(from: date)
        }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        return returnDate
    }
}
