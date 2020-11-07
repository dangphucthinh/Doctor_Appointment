//
//  SpecialistCollectionViewCell.swift
//  youMed
//
//  Created by Duy Dinh on 10/24/20.
//

import UIKit

class SpecialistCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}
