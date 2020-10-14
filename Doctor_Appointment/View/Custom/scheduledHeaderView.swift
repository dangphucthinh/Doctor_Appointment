//
//  scheduledHeaderView.swift
//  Doctor_Appointment
//
//  Created by DUY on 9/28/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class scheduledHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstView.layer.cornerRadius = 30
    }
}
