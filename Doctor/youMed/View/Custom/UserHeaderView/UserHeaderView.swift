//
//  UserHeaderView.swift
//  youMed
//
//  Created by Duy Dinh on 10/29/20.
//

import UIKit
import SDWebImage

class UserHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var name = BaseClient.shared.fullName
    var avatar = BaseClient.shared.avatar
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.backgroundColor = .systemBlue
        
        nameLabel.text = name.uppercased()
        self.imageView.sd_setImage(with: URL(string: "\(avatar ?? "not found")"), placeholderImage: UIImage(named: "no_image_poster"))
    }
}
