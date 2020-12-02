//
//  PatientViewCell.swift
//  youMed
//
//  Created by thinhdang on 12/2/20.
//

import UIKit

class PatientViewCell: UITableViewCell {

    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbIssue: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var imgAva: UIImageView!
    
    var data : Appointment?{
        didSet{
            guard let data = data else { return }
            lbName.text = data.patientName
            lbIssue.text = data.issue
            lbDate.text = dateToSQLDate(data.meetingTime!)
            let ava: String? = data.patientAvatar
            let url = URL.init(string: "\(ava ?? "Not found")")
            self.imgAva?.sd_setImage(with: url, placeholderImage: UIImage(named: "User"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ContentView.layer.cornerRadius = 10
        ContentView.layer.masksToBounds = true
        imgAva.roundedImageView()
        
    }
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
