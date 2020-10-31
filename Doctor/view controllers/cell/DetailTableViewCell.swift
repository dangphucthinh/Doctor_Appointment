//
//  DetailTableViewCell.swift
//  youMed
//
//  Created by Duy Dinh on 10/24/20.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialistLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var ContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        scheduleButton.layer.cornerRadius = 5
        scheduleButton.backgroundColor = .blue
        
        shadowView.layer.shadowRadius = 15
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowColor = CGColor(red: 0, green: 0, blue: 255, alpha: 0.5)
        shadowView.layer.shouldRasterize = true
        shadowView.layer.masksToBounds = false
        
        ContentView.layer.cornerRadius = 10
        ContentView.layer.masksToBounds = true
    }

}
