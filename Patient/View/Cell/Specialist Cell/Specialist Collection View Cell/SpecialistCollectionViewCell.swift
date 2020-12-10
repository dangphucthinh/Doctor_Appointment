//
//  SpecialistCollectionViewCell.swift
//  youMed
//
//  Created by thinhdang on 10/24/20.
//

import UIKit

protocol SpecialtyViewProtocol : AnyObject {
    func specialtyPage()
}

class SpecialistCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    weak var delegateSpecialty: SpecialtyViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imgTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imgHandleTap(_:)))
        imageView.addGestureRecognizer(imgTapGestureRecognizer)
        
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
    @objc func imgHandleTap(_ sender: UITapGestureRecognizer) {
        print("a")
        delegateSpecialty?.specialtyPage()
    }
    
    var data: HospitalSpecialty? {
        didSet {
            guard let data = data else { return }
        
            label.text = data.name
           
            let ava: String? = data.hosSpecImg
            let url = URL.init(string: "\(ava ?? "Not found")")
            self.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "User"))
        }
    }
}
