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

protocol doctorViewProtocol : AnyObject {
    func doctorPage(specName: String)
}

class SpecialistCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ContentView: UIView!
    weak var delegateSpecialty: SpecialtyViewProtocol?
    weak var delegateDoctor: doctorViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imgTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imgHandleTap(_:)))
        ContentView.addGestureRecognizer(imgTapGestureRecognizer)
        
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
    @objc func imgHandleTap(_ sender: UITapGestureRecognizer) {
        print("a")
        //delegateSpecialty?.specialtyPage()
        delegateDoctor?.doctorPage(specName: (data?.name)!)
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
