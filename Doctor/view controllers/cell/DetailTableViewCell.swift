//
//  DetailTableViewCell.swift
//  youMed
//
//  Created by Duy Dinh on 10/24/20.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var specialistLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var data: Doctor? {
        didSet {
            guard let data = data else { return }
            
            specialistLabel.text = data.specialtyName
            doctorNameLabel.text = data.fullName
            
            if(data.avatar!.count > 0){
                let ava: String? = data.avatar
                        let url = URL.init(string: "\(ava!)")
                
                        self.doctorImage?.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
            }
                
    }
        
}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadInformation()
 
    }
    
   private func loadInformation(){
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