//
//  UserHeaderView.swift
//  youMed
//
//  Created by Duy Dinh on 10/29/20.
//

import UIKit

class UserHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.backgroundColor = .systemBlue
    }
}
