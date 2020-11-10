//
//  ConfirmPatientTableViewCell.swift
//  youMed
//
//  Created by Oscar on 11/10/20.
//

import UIKit

class ConfirmPatientTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var issueLb: UILabel!
    @IBOutlet weak var dateOfBirthLb: UILabel!
    @IBOutlet weak var phoneLb: UILabel!
    
    var patient: Patient?
    var doctor: Doctor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
