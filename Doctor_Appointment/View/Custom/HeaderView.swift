//
//  HeaderView.swift
//  Doctor_Appointment
//
//  Created by DUY on 9/22/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    var name = BaseClient.shared.userId
    override func awakeFromNib() {
        firstView.layer.cornerRadius = CGFloat(30)
        lbTitle.text = name
    }
}
