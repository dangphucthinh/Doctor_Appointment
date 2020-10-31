//
//  dateCollectionViewCell.swift
//  Doctor_Appointment
//
//  Created by DUY on 9/27/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class dateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var isTapped = false
    @IBAction func isButtonTapped(_ sender: NSObject) {
        if isTapped == false {
            isTapped = true
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
        } else {
            isTapped = false
            button.backgroundColor = .white
            button.setTitleColor(.systemBlue, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
