//
//  DoctorViewController.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//
import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var viewContainer: DesignableView!
    @IBOutlet weak var imgAvatar: DesignableImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
