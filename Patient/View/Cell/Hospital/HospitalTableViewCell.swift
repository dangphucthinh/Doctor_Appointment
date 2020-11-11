//
//  HospitalTableViewCell.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import UIKit

protocol HospitalViewCellProtocol : AnyObject {
    func hospitalPage()
}
class HospitalTableViewCell: UITableViewCell {

    weak var delegate : HospitalViewCellProtocol?
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var addressLb: UILabel!
    
    var data : Hospital?{
        didSet{
            guard let data = data else { return }
            
            nameLb.text = data.name
            addressLb.text = data.address
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
